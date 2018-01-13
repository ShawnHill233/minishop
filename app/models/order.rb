class Order < ApplicationRecord
  require 'digest'

  belongs_to :user
  has_many :line_items, -> { order(:created_at) }, inverse_of: :order, dependent: :destroy
  accepts_nested_attributes_for :line_items

  STATE = %w(pending payment completed canceled)
  PAYMENT_STATES = %w(failed paid)
  validates_inclusion_of :state, :in => STATE

  before_create do
    time_now = "#{Time.now.to_i}"
    self.number = "#{time_now[-5..-1]}#{user.id*2}#{time_now[-10..-6]}"
  end

  include AASM
  aasm column: :state do
    state :pending, initial: true   #待支付
    state :payment                  #支付中
    state :deliver                  #待发货（服务）
    state :completed                #完成交易（服务）
    state :canceled

    event :start_pay do
      transitions from: :pending, to: :payment do
      end
    end

    event :complete_pay do
      transitions from: :payment, to: :payment do
        after do
          self.payment_state = 'paid'
          self.save
          PaymentLog.create_log(self)
          PointsJob.perform_async('payment_completed', self.user_id, self.amount/100/10) if self.amount.present?
          ExperienceIncJob.perform_async(self.user.persistent_token, 'payment_completed')
        end
      end
    end

    event :break_pay do
      transitions from: :payment, to: :payment do
        after do
          self.payment_state = 'failed'
          self.save
        end
      end
    end

    event :delay_pay do
      transitions from: [:payment], to: :completed do

      end
    end

    event :complete do
      transitions from: :payment, to: :completed, :guard => :if_paid? do

      end
    end

    event :cancel do
      transitions from: [:pending, :payment], to: :canceled do
      end
    end
  end

  def if_paid?
    payment_state == 'paid'
  end

  def total_amount
    line_items.inject(0){ |sum, item| sum + item.price * item.quantity }
  end
  class << self
    def create_order(user, line_items)
      new_order = user.orders.new
      new_order.line_items = line_items
      new_order.save!
      user.cart.line_items.delete(line_items)
      return new_order
    end

    def mp_pay_params(order_number)
      time_stamp = Time.now.to_i.to_s
      nonce_str = SecureRandom.hex
      package = "prepay_id=#{order_number}"
      sign_type = 'MD5'
      sign_string="appId=#{Settings.wx_appid}&nonceStr=#{nonce_str}&package=#{package}&signType=#{sign_type}&timeStamp=#{time_stamp}&key=#{Settings.wx_secret}"
      pay_sign = Digest::MD5.hexdigest(sign_string).upcase

      params = {
          timeStamp: time_stamp,
          nonceStr: nonce_str,
          package: package,
          signType: sign_type,
          paySign: pay_sign
      }
    end
  end
end

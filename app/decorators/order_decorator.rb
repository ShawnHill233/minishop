class OrderDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def state
    case object.state
      when 'payment'
        case object.payment_state
          when 'paid' || 'delay'
            '待服务'
          else
            '待付款'
        end
      when 'completed'
        '交易成功'
      when 'canceled'
        '已取消'
      else
        ''
    end

  end

  def payment_state
    case object.payment_state
      when 'delay'
        '到店支付'
      when 'paid'
        '已付款'
      else
        '未付款'
    end
  end

end

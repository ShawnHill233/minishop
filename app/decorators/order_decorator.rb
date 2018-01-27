class OrderDecorator < ApplicationDecorator
  delegate_all

  def created_at
    common_datetime_text(object.created_at)
  end

  def state
    case object.state
      when 'payment'
        case object.payment_state
          when 'paid'
            '待服务'
          when'delay'
            '待服务，到店支付'
          else
            '待付款'
        end
      when 'deliver'
        '待服务'
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

class OrderJob
  include Sidekiq::Worker

  def perform(order_id)
    order = Order.find(order_id)
    unless order.paid?
      order.cancel!
    end
  end

end
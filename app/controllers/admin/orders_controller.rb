module Admin
  class OrdersController < AdminController
    before_action :set_order, only: [:show, :completed]
    def index
      @orders = Order.all.order(created_at: :desc).decorate
    end

    def show
      @order = @order.decorate
    end

    def completed
      @order.complete!
      flash[:success] = '已完成订单'
      redirect_to admin_order_path(@order)
    end

    private
    def set_order
      @order = Order.find(params[:id])
    end
  end
end
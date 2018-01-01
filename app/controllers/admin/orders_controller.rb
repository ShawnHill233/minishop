module Admin
  class OrdersController < AdminController
    before_action :set_order, only: [:show]
    def index
      @orders = Order.all.order(created_at: :desc)
    end

    def show
    end

    private
    def set_order
      @order = Order.find(params[:id])
    end
  end
end
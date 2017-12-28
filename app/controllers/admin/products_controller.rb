module Admin
  class ProductsController < AdminController
    def new
      @product = Product.new
    end

    def create
      @product = Product.create(product_params)

    end

    def index
      @products = Product.order(created_at: :desc)
    end

    def show

    end

    def edit
    end


    private
    def product_params
      params[:product].permit!
    end
  end
end

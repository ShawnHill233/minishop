module Admin
  class ProductsController < AdminController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    def new
      @product = Product.new
    end

    def create
      begin
        params = product_params
        image_urls = params.delete(:images)
        @product = Product.create!(product_params)
        image_urls.each do |image_url|
          @product.images << Image.create(url: image_url)
        end
        redirect_to admin_products_path
      end
    end

    def index
      @products = Product.order(created_at: :desc)
    end

    def show

    end

    def edit
    end

    def update
      begin
        params = product_params
        image_urls = params.delete(:images)
        @product.update(product_params)
        @product.images.delete_all
        image_urls.each do |image_url|
          @product.images << Image.create(url: image_url)
        end
        redirect_to admin_products_path
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path
    end


    private
    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params[:product].permit!
    end
  end
end

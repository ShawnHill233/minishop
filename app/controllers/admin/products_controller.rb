module Admin
  class ProductsController < AdminController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    def new
      set_aliyun_upload
      @product = Product.new
      # @product_property = @product.product_properties.build
      # @properties = @product_property.build_property
    end

    def create
      begin
        @product = Product.new(product_params)
        if set_images && set_brand && @product.save
          redirect_to admin_products_path
        else
          flash[:error] = "创建失败：#{@product.errors.full_messages}"
          render :new
        end
      end
    end

    def index
      @products = Product.order(created_at: :desc)
    end

    def show

    end

    def edit
      set_aliyun_upload
    end

    def update
      begin
        puts params
        if set_images && set_brand && @product.update(product_params) && @product.save
          redirect_to admin_products_path
        else
          flash[:error] = "更新失败：#{@product.errors.full_messages}"
          redirect_to edit_admin_product_path(@product)
        end
      end
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path
    end


    private
    def set_images
      @product.images.delete_all unless @product.new_record?
      if params[:images].present?
        params[:images].each do |image_url|
          @product.images << Image.create(url: image_url)
        end
      end
      true
    end
    def set_brand
      if params[:brand_id].present?
        brand = Brand.find(params[:brand_id])
        @product.brand = brand
      else
        true
      end
    end

    def set_product
      @product = Product.find(params[:id])
    end
    def product_params
      params[:product].permit!
    end
  end
end

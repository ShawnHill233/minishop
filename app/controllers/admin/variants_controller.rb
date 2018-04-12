module Admin
  class VariantsController < AdminController
    before_action :set_product
    before_action :set_variant, only: [:edit, :update, :destroy]

    def index
      @variants = @product.variants
    end

    def new
      @variant = @product.variants.new
    end

    def create
      @variant = @product.variants.new(variant_params)
      if @variant.save
        redirect_to admin_product_variants_path(@product)
      else
        flash[:error] = "创建失败：#{@product.errors.full_messages}"
        render :new
      end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_variant
      @variant = @product.variants.find(params[:id])
    end

    def variant_params
      params[:variant].permit!
    end

  end
end

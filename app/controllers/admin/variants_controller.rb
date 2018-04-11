module Admin
  class VariantsController < AdminController
    before_action :set_product
    before_action :set_variant, only: [:edit, :update, :destroy]

    def index
      
    end

    def new
      
    end

    def create
      
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

  end
end

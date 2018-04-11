module Admin
  class ProductPropertiesController < AdminController
    before_action :set_product
    before_action :find_properties
    # before_action :setup_property, only: :index

    def index
      
    end

    private

    def set_product
      @product = Product.find(params[:product_id])
    end

    def find_properties
      @properties = Property.pluck(:name)
    end

    # def setup_property
    #   @product.product_properties.build
    # end
  end
end

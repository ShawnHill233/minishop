module Admin
  class BrandsController < AdminController
    before_action :set_brand, only: [:edit, :update, :destroy]
    def index
      @brands = Brand.all
    end

    def new
      set_aliyun_upload
      @brand = Brand.new
    end

    def create
      @brand = Brand.new(brand_params)
      @brand.save
      redirect_to admin_brands_path
    end

    def edit
      set_aliyun_upload
    end

    def update
      @brand.update(brand_params)
      redirect_to admin_brands_path
    end

    def destroy
      @brand.destroy
      redirect_to admin_brands_path
    end

    private
    def set_brand
      @brand = Brand.find(params[:id])
    end

    def brand_params
      params[:brand].permit!
    end
  end
end

module Admin
  class CategoriesController < AdminController
    before_action :set_category, only: [:edit, :destroy]
    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      @category.save
      redirect_to admin_categories_path
    end

    def edit
    end

    def destroy
      @category.destroy
      redirect_to admin_categories_path
    end

    private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params[:category].permit!
    end
  end
end

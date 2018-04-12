module Admin
  class OptionTypesController < AdminController
    before_action :set_option_type, only: [:edit, :update, :destroy]

    def index
      @option_types = OptionType.all
    end

    def new
      @option_type = OptionType.new
    end

    def create
      @option_type = OptionType.new(option_type_params)
      if @option_type.save
        redirect_to admin_option_types_path
      else
        flash[:error] = "创建失败：#{@option_type.errors.full_messages}"
        render :new
      end
    end

    def edit

    end

    def update
      if @option_type.update(option_type_params)
        redirect_to edit_admin_product_path(@product)
      else
        flash[:error] = "更新失败：#{@option_type.errors.full_messages}"
        render :edit
      end
    end

    def destroy
      @option_type.destroy
      redirect_to admin_option_types_path
    end

    private
    def set_option_type
      @option_type = OptionType.find(params[:id])
    end

    def option_type_params
      params[:option_type].permit!
    end

  end
end

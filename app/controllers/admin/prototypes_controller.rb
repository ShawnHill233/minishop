module Admin
  class PrototypesController < AdminController
    before_action :set_prototype, only: [:edit, :update, :destroy, :get_property_names]
    def index
      @prototypes = Prototype.all
    end

    def new
      @prototype = Prototype.new
      @property_prototype = @prototype.property_prototypes.build
      @properties = @property_prototype.build_property
    end

    def create
      @prototype = Prototype.new(prototype_params)
      @prototype.save
      redirect_to admin_prototypes_path
    end

    def edit
    end

    def update
      @prototype.update(prototype_params)
      redirect_to admin_prototypes_path
    end

    def destroy
      @prototype.destroy
    end

    def get_property_names
      @property_names = @prototype.property_prototypes.map { |property_prototype| property_prototype.property.try(:name)}
      render :json => @property_names
    end

    private
    def set_prototype
      @prototype = Prototype.find(params[:id])
    end

    def prototype_params
      params[:prototype].permit!
    end
  end
end

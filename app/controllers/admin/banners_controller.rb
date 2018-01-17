module Admin
  class BannersController < AdminController
    before_action :set_banner, only: [:edit, :update, :destroy]
    def index
      @banners = Banner.all
    end

    def new
      set_aliyun_upload
      @banner = Banner.new
    end

    def create
      @banner = Banner.new(banner_params)
      @banner.save
      redirect_to admin_banners_path
    end

    def edit
      set_aliyun_upload
    end

    def update
      @banner.update(banner_params)
      redirect_to admin_banners_path
    end

    def destroy
      @banner.destroy
      redirect_to admin_banners_path
    end

    private
    def set_banner
      @banner = Banner.find(params[:id])
    end

    def banner_params
      params[:banner].permit!
    end
  end
end
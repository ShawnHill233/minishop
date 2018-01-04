class BrandAPI < Grape::API
  include Grape::Kaminari

  resources :brands do

    route_param :id do
      desc '获取品牌详情'
      get do
        brand = Brand.find(params[:id])
        present brand, with: Entities::Brand
      end
    end
  end
end

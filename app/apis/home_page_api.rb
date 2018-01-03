class HomePageAPI < Grape::API

  namespace :home_page do
    desc '获取首页数据'

    get do
      banners = Banner.all
      products = Product.all
      present OpenStruct.new(banners: banners, products: products), with: Entities::HomePage
    end

  end
end

class HomePageAPI < Grape::API

  namespace :home_page do
    desc '获取首页数据'

    get do
      products = Product.all
      present products: products
    end

  end
end

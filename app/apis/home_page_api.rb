class HomePageAPI < Grape::API

  namespace :home_page do
    desc '获取首页数据'
    get do
      banners = Banner.all
      tire_brands = Brand.where(name: ["米其林", "德国马牌", "固特异", "倍耐力", "普利司通", "邓禄普", "韩泰", "佳通", "玛吉斯", "欧威森"])
      clear_brands = Brand.where(name: ["美孚", "嘉实多", "壳牌"])
      present OpenStruct.new(banners: banners, tire_brands: tire_brands, clear_brands: clear_brands), with: Entities::HomePage
    end

  end
end

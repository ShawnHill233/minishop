# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

beinaili_luntai = [
'185/60R15 P1 84H',
'185/65R15 P1 88H',
'195/55R15 P1 85V',
'195/60R15 P1 88V',
'195/65R15 P1 91V',
'205/65R15 P1 94V',
'215/70R15 P1 98H',
'195/60R16 P1 89H',
'205/55R16 P1 91V',
'205/55R16 P7 91W',
'205/60R16 P1 92V',
'205/60R16 P7 92W',
'205/65R16 P1 95H',
'215/55R16 P1 93W',
'215/60R16 P1 99V',
'215/60R16 P7 97W',
'215/65R16 VEAS 98V',
'215/65R16 P1 98H',
'225/55R16 P7 99W',
'225/60R16 P1 102V',
'215/50R17 P1 95WXL',
'215/55R17 oldP7 94V',
'215/55R17 P1 94V',
'215/55R17 P7 94V',
'225/55R17 P7 101WXL',
'225/60R17 P4 99H',
'225/45R17 P7 91W',
'235/45R17 P7 97W',
'235/55R17 P7 99W',
'245/45R17 P7 95W',
'235/45R18 P7 98Y',
'215/60R17 VEAS 96V',
'225/65R17 STR 102H',
'235/60R16 VEAS 100H',
'235/65R17 VEAS 108V',
'245/55R19 VEAS 103H',
'245/65R17 ATR 113T',
'245/70R16 ATR 113T',
'255/65R17 ATR 110T',
'265/60R18 ATR 110T',
'265/60R18 VEAS 110H',
'265/65R17 ATR 112H',
'285/60R18 VEAS 120V',
'235/50R18 VEAS 97V',
'235/55R18 VEAS 104V',
'235/60R18 VEAS 107V',
'245/40R18 P7 97Y',
'245/45R18 P7 100Y',
'255/40R18 P7 99Y',
'255/55R18 VEAS 109Y',
'235/50R19 VERD 99V',
'235/55R19 VEAS 101W',
'255/45R19 VEAS 100W',
'255/50R19 VEAS 103Y',
'255/55R19 PZERO 111W',
'255/55R20 VEAS 110Y',
'275/45R20 VEAS 110Y',
'275/45R21 VEAS 110Y',
'205/60R16 P7 RSC 92W',
'225/50R17 P7 94W',
'225/55R17 P7 97Y',
'245/45R18 P7 96Y',
'245/50R18 P7 100Y',
'245/45R19 P7 98Y',
'275/40R19 P7 101Y',
'255/55R18 VERD 109V',
'235/55R19 VERD 101V',
'245/40R19 P7 98Y',
'315/35R20 P0 110Y'
]

p1_image_url = 'static/%E5%80%8D%E8%80%90%E5%8A%9BP1.jpeg'
p7_image_url = 'static/%E5%80%8D%E8%80%90%E5%8A%9BP7.jpeg'
veas_image_url = 'static/%E5%80%8D%E8%80%90%E5%8A%9Bveas.jpeg'

brand = Brand.find_or_create_by(name: '倍耐力')
properties = ['轮胎品牌', '产品规格', '轮胎花纹']
properties.each do |p|
  Property.create(name: p)
end
beinaili_luntai.each_with_index do |tire, index|
  product = Product.new(name: '倍耐力 ' + tire, description: tire, available:true, price: 1)
  if tire.include?('P1')
    product.images << Image.create(url: p1_image_url)
  elsif tire.include?('P7')
    product.images << Image.create(url: p7_image_url)
  elsif tire.include?('VEAS')
    product.images << Image.create(url: veas_image_url)
  else
    next
  end
  product.brand = brand

  properties = Property.all
  properties.each do |p|
    case p.name
      when '轮胎品牌'
        product.product_properties.new(property_id: p.id, value: '倍耐力')
      when '产品规格'
        product.product_properties.new(property_id: p.id, value: tire.split(' ')[0])
      when '轮胎花纹'
        product.product_properties.new(property_id: p.id, value: tire.split(' ')[1])
    end
  end

  product.position = index * 5
  product.save
end
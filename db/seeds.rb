

## 已执行
=begin
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
=end

miqilin_tire = [
'185/65R14 Energy XM2 86H',
'195/60R14 Energy XM2 86H',
'185/60R15 84H XM2',
'195/55R15 85V  ENERGY XM2',
'195/60R15 Energy XM2 88V',
'195/65R15 91V  ENERGY XM2',
'195/65R15 91V  PRIMACY3ST',
'205/65R15 94V  ENERGY XM2',
'215/75R15 Lattour Cross 100T',
'205/55R16 91V  ENERGY XM2',
'205/55R16 91W  PRIMACY 3ST',
'205/60R16 92V  PRIMACY 3ST',
'205/60R16 92V  PRIMACY LC DT',
'205/65R16 PRIMACY 3 ST',
'215/55R16 93W  PRIMACY LC',
'215/55R16 PRIMACY 3ST 97W',
'215/60R16 95V XL PRIMACY3ST',
'215/60R16 99V XL PRIMACY3ST',
'215/60R16 Energy XM2 95H',
'215/65R16 Primacy LC 98H',
'225/55R16 99W XL PRIMACY3ST',
'225/60R16 PRIMACY 3 ST',
'225/75R16 PRIMACY SUV 104H',
'235/60R16 Latitude Sport 3 NO 103W',
'235/70R16 106H  PRIMACY SUV',
'265/70R16 112H PRIMACY SUV',
'265/70R16 LTX FORCE 112T',
'215/45ZR17 Pilot Sport PS3 91W',
'215/50R17 91W  PRIMACY LC',
'215/50R17 91W  PRIMACY LC DT',
'215/50R17 95W XL PRIMACY3ST',
'215/50ZR17 Pilot Sport PS3 91W',
'215/55R17 94V  PRIMACY3ST',
'215/55R17 94V  PRIMACY3STDT2',
'215/60R17 96V  PRIMACY3ST',
'225/45R17 94W XL PRIMACY3ST',
'225/50R17 94V  PRIMACY LC DT',
'225/50R17 94V  PRIMACY3ST DT',
'225/50R17 98W XL PRIMACY3ST',
'225/60R17 PRIMACY 3 ST',
'225/65R17 102H  PCY SUV',
'235/45R17 97W XL PRIMACY3ST',
'235/55R17 99V  PILOT SPORT 3 ST AO',
'235/65R17 108V  PRIMACY SUV',
'245/45R17 99W XL PRIMACY3ST',
'245/65R17 107H  PRIMACY SUV',
'245/65R17 111T LTX FORCE',
'255/45R17 98W  PRECED PP2',
'265/65R17 112H  PRIMACY SUV',
'265/65R17 LTX FORCE 112T',
'215/55R18 99V XL PRIMACY3ST',
'225/55R18 98V PRIMACY 3ST',
'225/60R18 100H  PRIMACY SUV',
'235/45R18 94V  PILSP3 ST RP',
'235/50R18 PRIMACY 3 ST',
'235/50R18 PRIMACY 3 ST  DT',
'235/55R18 100V  LATTOURHP',
'235/55R18 100V PRIMACY 3 ST',
'235/60R18 103V  PCY SUV',
'235/60R18 103W  PRECED PP2 AO',
'245/45R18 100W  PCY3ST VOLDT',
'245/45R18 100W XLPRIMACY3ST',
'255/40ZR18 (99Y) PILOT SPORT 3MO1',
'255/45R18 99W  PRIMACY3ST',
'255/55R18 LATITUDE SPORT N1 109Y',
'255/55R18 LATITUDE TOUR HP',
'255/60R18 LATITUDE SPORT 3 112V',
'265/60R18 LTX FORCE 110T',
'275/45R18 Primacy HP MO 103Y',
'215/45ZR17 91Y  PILOT SPORT 4',
'225/55R17 97W  PRIMACY 3 ST ZP *',
'225/45R1895Y XL PRIMACY3 ZPMOE',
'245/45R18 100Y  PRIMACY3ST ZP *MOE',
'245/45R19 98Y  PRIMACY 3 ZP*S1',
'255/35ZR19 PILOT SUPER SPORT ZP 96Y',
'315/35R20 110Y LATITUDE SPORT 3 ZP',
'235/55R20 102H  PRIMACY SUV',
'235/55R19 Latitude Sport 3 105W',
'245/40ZR19 Pilot Sport PS3 98Y',
'245/40ZR19 (98Y) PILOT SUPER SPORT',
'245/45R19 Latitude Tour HP 98V',
'245/45R19 PILOT SPORT 3 MO102Y',
'245/45R19 PRIMACY 3ST 102W',
'245/45R20 99V  LAT SPORT',
'245/55R19 103H PRIMACY SUV',
'245/55R19 103V  LATITUDE TOUR HP',
'255/45R19 100V  LA SPORT 3',
'255/45R20 101W LATITDUDE SPORT AO',
'255/45ZR19 Pilot Super Sport NO 100Y',
'255/50R19 103Y LATITUDE SPORT 3 NO',
'255/55R19 Latitude Tour HP 111V',
'255/55R20 LATITUDE SPORT 110Y',
'265/35ZR19 98Y  PILOT SUPER SPORT MO',
'265/45R20 104Y LATITUDE SPORT 3 NO',
'265/50R19 LATITUDE SPORT 3 NO 110Y',
'275/35ZR19 100Y PILOT SUPER SPORT*',
'275/40R20 106Y XL LA SPORT 3',
'275/45R19 108Y XL LA SPORT 3',
'275/45R20 Latitude Sport 110Y N0',
'275/50R20 Latitude Sport MO 109W',
'285/40R19 103V PILSPT AS+ N1',
'295/35R21 103Y  LATITUDE SPORT 3 NO',
'295/35R21 107Y  LAT SPORT N1',
'295/35R21 LATITUDE SPORT 3 NI 107Y',
'325/30ZR21 (104Y)  PILOT SPORT CUP2 NO',
'225/40ZR19 (93Y)  PILOT SUPER SPORT',
'235/50R19 103V  LATITUDE SPORT 3',
'245/45R20 103W  LATITUDE SPORT 3',
'255/50R20 109Y  LATITUDE SPORT 3',
'275/45R19 108Y  N0 LATITUDE SPORT',
'285/35ZR20 (104Y) PILOT SPORT 3 MO',
'315/35R20 110V  PILOT SPORT A/S 3 N0',
'245/60R18 105V  PRIMACY SUV MI',
'235/55R19 101V LATITUDE SPORT 3 DT',
]

xm2 = 'static/%E7%B1%B3%E5%85%B6%E6%9E%97XM2-1.jpg'
pilot_super = 'static/%E7%B1%B3%E5%85%B6%E6%9E%97-pilot-super.jpg'
pilot = 'static/%E7%B1%B3%E5%85%B6%E6%9E%97pilot.jpg'
latitude_tour = 'static/%E7%B1%B3%E5%85%B6%E6%9E%97-Latitude%20Tour.jpg'
latitude_sport = 'static/%E7%B1%B3%E5%85%B6%E6%9E%97-Latitude%20Sport.jpg'
primacy_suv= 'static/%E7%B1%B3%E5%85%B6%E6%9E%97-PRIMACY%20SUV.jpg'
primacy_3st = 'static/%E7%B1%B3%E5%85%B6%E6%9E%97-PRIMACY%203ST.jpg'
primacy_lc= 'static/%E7%B1%B3%E5%85%B6%E6%9E%97-PRIMACY%20LC.jpg'

brand = Brand.find_or_create_by(name: '米其林')

miqilin_tire.each_with_index do |tire, index|
  tire = tire.upcase
  product = Product.new(name: '米其林 ' + tire, description: tire, available:true, price: 0.01)
  if tire.include?('XM2')
    product.images << Image.create(url: xm2)
  elsif tire.include?('PILOT') && tire.include?('SUPER')
    product.images << Image.create(url: pilot_super)
  elsif tire.include?('PILOT')
    product.images << Image.create(url: pilot)
  elsif tire.include?('LATITUDE') && tire.include?('TOUR')
    product.images << Image.create(url: latitude_tour)
  elsif tire.include?('LATITUDE') && tire.include?('SPORT')
    product.images << Image.create(url: latitude_sport)
  elsif tire.include?('PRIMACY') && tire.include?('SUV')
    product.images << Image.create(url: primacy_suv)
  elsif tire.include?('PRIMACY') && tire.include?('3ST')
    product.images << Image.create(url: primacy_3st)
  elsif tire.include?('PRIMACY') && tire.include?('LC')
    product.images << Image.create(url: primacy_lc)
  else
    next
  end
  product.brand = brand

  properties = Property.all
  properties.each do |p|
    case p.name
      when '轮胎品牌'
        product.product_properties.new(property_id: p.id, value: '米其林')
      when '产品规格'
        product.product_properties.new(property_id: p.id, value: tire.split(' ')[0])
      # when '轮胎花纹'
      #   product.product_properties.new(property_id: p.id, value: tire.split(' ')[1])
    end
  end

  product.position = index * 5
  product.save
end
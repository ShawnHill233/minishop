

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


# 米其林
=begin

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
=end

=begin
#马牌
mapai_tire = [
    '175/65R14 82H CC6 #',
    '175/70R14 84H CC6 #',
    '185/60R14 82H CC6 #',
    '185/65R14 86H CC5 ##',
    '185/65R14 86H CC6 #',
    '195/60R14 86H CPC2#',
    '175/55R15 77T FR CEC3',
    '175/55R15 77T FR CPC 2',
    '175/65R15 84H CC5 #',
    '175/65R15 84H CPC2 *',
    '185/55R15 86V CC5',
    '185/60R15 84H CC6 #',
    '185/60R15 84H UC6 #',
    '185/65R15 88H CC6 #',
    '185/65R15 88H UC6 #',
    '195/50R15 82T TL FR CPC 2',
    '195/50R15 82V FR UC6 #',
    '195/50R15 82V PC2 ###',
    '195/55R15 85V FR CC6 #',
    '195/55R15 85V FR UC6 #',
    '195/60R15 88V COMC CC6 #',
    '195/60R15 88V ULTC UC6 #',
    '195/65R15 91V CC6 #',
    '195/65R15 91V ULTC UC6 #',
    '205/65R15 94V ULTC UC6 #',
    '185/50R16 81H PROCTX',
    '195/55R16 87V CPC2 SSR *',
    '195/55R16 87V FR CPC MO',
    '195/55R16 91H XL FR MC5',
    '195/60R16 89H FR  CC5',
    '195/60R16 89H FR  CC6 #',
    '195/60R16 89H FR  UC6 #',
    '205/45R16 83H FR PROCTX',
    '205/45R16 83W FR ULTC UC6 #',
    '205/55R16 91V CPC SSR',
    '205/55R16 91V CPC SSR * #',
    '205/55R16 91V FR  CC5',
    '205/55R16 91V FR  CC6 #',
    '205/55R16 91V FR  MC5 ##',
    '205/55R16 91V FR  UC6 #',
    '205/55R16 91V FR ContiMaxCont',
    '205/55R16 91W CPC5 SSR *',
    '205/60R16 92H FR  CC6 #',
    '205/60R16 92V CPC5 SSR*',
    '205/60R16 92V PC5 SSR *',
    '205/60R16 96V XL  UC6 #',
    '205/60R16 96V XL CPC 2 #',
    '205/65R16 95H  CC5 ##',
    '215/45R16 90V XL FR PC2 AO',
    '215/55R16 93V FR  CC6 #',
    '215/55R16 93V FR  MC5 #',
    '215/55R16 93V FR  UC6 #',
    '215/60R16 95V FR  CC6 #',
    '215/60R16 95V FR  UC6 #',
    '215/65R16 98H FR  LX 2 #',
    '215/65R16 98H PROCTX #',
    '215/65R16 98V CC5 ##',
    '225/55R16 95W FR  CC6 #',
    '225/55R16 95W FR COMC CC6 #',
    '225/55R16 95W FR ULTC UC6 #',
    '225/55R16 95W ML PC2 MO',
    '225/55R16 95W PC2 SSR *',
    '225/55R16 95W PC5 SSR #',
    '225/60R16 98V FR  CC6',
    '225/60R16 98W CPC2 ##',
    '225/70R16 103H FR CCLX2 #',
    '235/60R16 100H FR CCLX2',
    '235/60R16 100W PC2 #',
    '245/70R16 111S FR CCAT #',
    '245/70R16 111T XL FR CCLX2 #',
    '205/45R17 84V CSC3 SSR*',
    '205/45R17 84V TL CSPC 3 SSR*',
    '205/45R17 84W CSC3 SSR*',
    '205/50R17 89W TL CPC 2 SSR *',
    '205/50R17 93V XL MAXC MC5 #',
    '205/50R17 93W XL UC6 #',
    '205/55R17 91V CPC2 SSR *',
    '205/55R17 91W CPC5 SSR *',
    '205/55ZR17 91Y FR CSC3 N2',
    '215/40R17 87W XL FR PC2 AO',
    '215/45R17 87V FR CSC 2 MO',
    '215/45R17 91Y XLFR MC6 #',
    '215/45ZR17 91W  FR MC5 #',
    '215/50R17 91V FR MC5 #',
    '215/50R17 91W FR UC6 #',
    '215/55R17 94V FR CC6 #',
    '215/55R17 94V FR ContiMaxContact MC5 #',
    '215/55R17 94V FR MAXC MC5 #',
    '215/55R17 94W CPC5 CS',
    '215/55R17 94W FR UC6 #',
    '215/55R17 98V XL MC5',
    '215/60R17 96H CPC2 #',
    '215/60R17 96H CPC5',
    '215/60R17 96H FR CCLX2 #',
    '215/60R17 96H FR PROCTX#',
    '225/45R17 91V FR   MC5',
    '225/45R17 91W CSC2 SSR *',
    '225/45R17 91W CSC3 ##',
    '225/45R17 91W CSC5 SSR #',
    '225/45R17 91W CSC5 SSR MOE',
    '225/45R17 91W FR CSC5 MO',
    '225/45R17 91Y FR CSC5 MO',
    '225/45R17 94W XL FR MC6 #',
    '225/45ZR17 91W FR  MC5 #',
    '225/50R17 94V FR  MC5 #',
    '225/50R17 94V FR CCLX2  D9',
    '225/50R17 94W FR CSC5 SSR #',
    '225/50R17 94W FR CSC5 SSR *',
    '225/50R17 94Y FR CSC2 AO',
    '225/50R17 98V XL FR PC2 CS',
    '225/50R17 98W XL  CC6 #',
    '225/50R17 98W XL  UC6 #',
    '225/50ZR17 98W FR MC5 ##',
    '225/55R17  97W CPC2 SSR #',
    '225/55R17 101W XL CC6 #',
    '225/55R17 101W XL UC6 #',
    '225/55R17 97W PC5 CS',
    '225/55RF17 97Y CPC2 SSR',
    '225/60R17 99H 4x4C#',
    '225/60R17 99H CCLXSP #',
    '225/60R17 99V FR  CC6',
    '225/60R17 99V FR COMC CC6 D9',
    '225/60R17 99V FR UC6 SUV #',
    '225/65R17 102H FR LX 2 #',
    '235/45R17 94W FR  CSC3 M0',
    '235/45R17 94W FR SC5 CS',
    '235/45R17 97W XL  MC6 #',
    '235/45R17 97W XL  UC6 #',
    '235/45R17 97W XL COMC CC6 #',
    '235/45RF17 97W FR CSC3 SSR',
    '235/45RF17 97W XL FR SC3 SSR',
    '235/45ZR17 97W XL MC5 #',
    '235/50R17 96W FR UC6 #',
    '235/55R17 99H FR UHP #',
    '235/55R17 99V FR LX2',
    '235/55R17 99V FR UC6 SUV #',
    '235/55R17 99W FR  UC6 #',
    '235/55R17 99W FR COMC CC6 #',
    '235/55R17 99W FR CSC2 MO',
    '235/60R17 102V  ML 4*4 MO',
    '235/65R17 108V XL LXSP LR',
    '235/65R17 108V XL UC6 SUV #',
    '235/65R17 108V XL UHP',
    '235/65R17 108V XL UHP N0#',
    '245/40R17 95W XL FR MC6 #',
    '245/45R17 95H FR CPROC SSR',
    '245/45R17 95W FR CC6 #',
    '245/45R17 95W FR CSC 5 MO',
    '245/45R17 95W FR UC6 #',
    '255/45R17 98W FR  UC6 #',
    '255/45R17 98W FR CSC5 SSR *',
    '255/45R17 98W FR MC5',
    '255/45R17 98Y FR CSC5 MO',
    '255/60R17 106H FR CCC LX 2 #',
    '265/65R17 112H FR CCLX2 #',
    '285/65R17 116T FR CCLX2 #',
    '215/45R18 93W XL  MC6 #',
    '215/55R18 95H CPC 2 ##',
    '215/55R18 95V FR MAXC MC5 #',
    '215/55R18 95V FR MAXC MC5 #',
    '225/40R18 92Y FR CSC5 MO',
    '225/40R18 92Y XL FR MC6 #',
    '225/40ZR18 92W XL FR MC5',
    '225/45R18 91V  CSC5 SSR*',
    '225/45R18 91W FR MAXC MC5 ##',
    '225/45R18 91Y  CSC5 SSR*',
    '225/45R18 95V  UC6',
    '225/45R18 95W  CSC5 CS',
    '225/45R18 95Y  FR SC5',
    '225/45R18 95Y SC5 SSR MOE',
    '225/45R18 95Y XL FR MC6 #',
    '225/45ZR18 91W FR MC5 #',
    '225/50R18 95W SC5 SSR *',
    '225/50R18 95W SC5 SSR*D5',
    '225/55R18 102H XL FR UHP',
    '225/55R18 98H  UHP #',
    '225/55R18 98H PROCTX',
    '225/55R18 98H PROCTX',
    '225/55R18 98V FR CCLX2 #',
    '225/55R18 98V PROCTX #',
    '225/60R18 100H FR CCC LX 2',
    '225/60R18 100H PROCTX',
    '225/60R18 100H PROCTX',
    '235/40ZR18 95Y FR SC5P MO',
    '235/40ZR18 95Y XL MC5 #',
    '235/45R18 98Y XL FR MC6 #',
    '235/45ZR18 94W FR  MC5',
    '235/50R18 101W XL UC6 #',
    '235/50R18 97V FR  UHP #',
    '235/50R18 97V SC5 SSR MOE',
    '235/50R18 97Y FR SC5 MGT',
    '235/55R18 100V CSC5 SUV #',
    '235/55R18 100V CSC5 SUV CS',
    '235/55R18 104Y XL CPC2 AO',
    '235/60R18 103H SC5 SUV VOL',
    '235/60R18 103V CSC5 SUV #',
    '235/60R18 103V PROCTX N0',
    '235/60R18 103V UHP #',
    '235/60R18 103V UHP CS ###',
    '235/60R18 103W CSC5 NO',
    '235/65R18 106W SC5 SUV AO',
    '245/40R18 97Y CSC5 SUV SSR MOE',
    '245/40R18 97Y XL FR SC3 MO',
    '245/40ZR18 97W XL FR MC5 #',
    '245/45R18 100W XL  UC6 #',
    '245/45R18 100Y FR  MC6 #',
    '245/45R18 96W  FR  CC6 #',
    '245/45R18 96W FR CSC5 CS',
    '245/45R18 96W FR MAXC MC5',
    '245/45R18 96W FR MAXC MC5',
    '245/45R18 96Y ContiSportContact 3 E SSR *',
    '245/45R18 96Y CSC3 E SSR*',
    '245/45R18 96Y CSC3 SSR #',
    '245/50R18 100W FR SC5 MO',
    '245/50R18 100Y ContiSportContact 3 SSR *',
    '245/50R18 100Y CSC 3 SSR*',
    '245/50R18 100Y CSC 3 SSR #',
    '245/50R18 100Y FR ULTC UC6 #',
    '245/50R18 104V FR SC5 MO-V',
    '245/50R18 104V XL FR SC5 MO-V',
    '245/50ZR18 100Y CSC5 N0',
    '255/35R18 94Y CSC3 MO',
    '255/40R18 95Y CSC5 SSR *',
    '255/40R18 99W XL FR CSC3',
    '255/40ZR18 (99Y) XL FR ContiSportContact 3',
    '255/40ZR18 99Y CSC3 MO',
    '255/45R18 99W CSC5 SSR *',
    '255/45R18 99Y FR CSC2 MO',
    '255/45R18 99Y FR UC6 #',
    '255/45ZR18 99Y FR  MC5 #',
    '255/55R18 105V FR PROCTX N0',
    '255/55R18 105W FR CSC5 N0',
    '255/55R18 105W ML CSC5 SUV MO',
    '255/55R18 105W ML UHP MO',
    '255/55R18 109V CSC5 SSR *',
    '255/55R18 109V CSC5 SSR#',
    '255/55R18 109V XL CCLXSP N0',
    '255/60R18 112V CSC5 SUV#',
    '265/35R18 97Y XL FR SC3 M0',
    '265/35R18 97Y XL FR SC3 MO',
    '275/35R18 95Y FR SC3 M0 #',
    '275/40R18 99Y SC3 E SSR*',
    '275/45R18 103W FR CSC5 MO',
    '275/45R18 103Y FR CSC2 MO',
    '275/45R18 103Y FR SC5 MGT',
    '275/45ZR18 103Y FR CSC5 NO',
    '275/45ZR18 103Y FR MC5 #',
    '225/40R19 89Y CSC5 SSR *',
    '225/40R19 93Y CSC5 SSR MOE',
    '225/40ZR19 93Y XL FR SC5P MO',
    '225/45R19 92W CSC5 SSR *',
    '225/55R19 99V FR UC6 SUV ###',
    '235/35ZR19 91Y CSC5P MO',
    '235/45R19 95H FR PROC',
    '235/45R19 95V CSC5 SSR MOE',
    '235/45ZR19 99Y CSC5P MO',
    '235/50R19 99V FR CCLXSP',
    '235/50R19 99V FR CCLXSP',
    '235/50R19 99V FR CCUHP MO',
    '235/50R19 99V FR CSC5 SUV',
    '235/50R19 99V FR SC5 SUV  D9',
    '235/50R19 99V ML 4X4C MO',
    '235/50R19 99V TL ML 4X4CONT MO',
    '235/55R19 101V PROCTX N0',
    '235/55R19 101Y CSC5 N0',
    '235/55R19 105V CEC 5 SUV',
    '235/55R19 105V LXSP LR',
    '235/55R19 105V UHP  LR',
    '235/55R19 105V XL FR SC5 SUV',
    '245/35R19 93Y CSC5 SSR MOE',
    '245/45R19 102Y  CSC5 MO',
    '245/45R19 98W   CSC3 SSR *',
    '245/45R19 98Y   CSC5',
    '245/55R19 103H ContiSportContact 5 SUV #',
    '245/55R19 103H CSC5 SUV#',
    '255/30ZR19 91Y XL SC5P MO',
    '255/35R19 92Y FR CSC5 SSR *',
    '255/35R19 96Y CSC5P AO',
    '255/35R19 96Y XL CSC5 SSR MOE',
    '255/35R19 96Y XL CSC5P MO',
    '255/35R19 96Y XL CSC5P SSR MOE',
    '255/35ZR19 (92Y) TL FR CSC5P*',
    '255/35R19 96Y XL FR SC5P AO',
    '255/35ZR19 96Y CSC5P AO',
    '255/35ZR19 96Y XL CSC5P MO',
    '255/40R19 100Y  CSC2 MO',
    '255/40R19 100Y  CSC5P',
    '255/40R19 100Y  CSC5P AO',
    '255/40R19 96W CSC5 SSR *',
    '255/45R19 100V CONTIPROCONTACT N1',
    '255/45R19 100V CSC5 CS',
    '255/45R19 100V FR CCUHP MO',
    '255/45R19 100V FR CrossContact UHP MO',
    '255/45R19 100V FR PROC CS N1',
    '255/45R19 100Y  CSC3 AO',
    '255/45ZR19 100Y CSC3 N0 #',
    '255/50R19 103V PROCTX N0',
    '255/50R19 103W SC5 SSR MOE',
    '255/50R19 103W UHP MO',
    '255/50R19 103Y CSC5 NO',
    '255/50R19 107H LXSP SSR MOE',
    '255/50R19 107V XL Contact UHP SSR *',
    '255/50R19 107V XL UHP SSR *',
    '255/50R19 107V XL CrossContact UHP SSR #',
    '255/50R19 107W  UHP SSR #',
    '255/50R19 107W XL CSC5 SSR *',
    '255/50R19 107Y XL UHP CS#',
    '255/55R19 107V CSC5 SUV D5',
    '255/55R19 111V XL 4X4C',
    '255/55R19 111V XL 4x4Contact',
    '255/55R19 111V XL FR CSC5 SUV',
    '255/55R19 111W LXSP J',
    '265/50R19 110Y XL FR CCUHP',
    '265/50R19 110Y XL FR UHP #',
    '275/35ZR19 (100Y) CSC5P*',
    '275/40R19 101W CSC3 SSR *',
    '275/40R19 101Y  CSC5 MO',
    '275/55R19 111V  4X4 MO',
    '285/30R19 98Y CSC5P SSR MOE',
    '285/30ZR19 98Y CSC5P MO',
    '285/40R19 103V FR CPC  CS  N1',
    '285/40ZR19 103Y CSC 3 N0 #',
    '285/45R19 107W FR ML CCUHP MO',
    '295/45ZR19 109Y UHP MO',
    '235/40ZR20 96Y XL SC5P MO',
    '235/55R20 102W FR CC UHP #',
    '245/40R20 99Y CSC5P MO',
    '245/45R20 103V LXSP LR',
    '245/45R20 103V UHP',
    '255/35R20 97Y  CSC2 MO',
    '255/40R20 101Y CSC5 AO',
    '255/40ZR20 (101Y) XL SC5P MO',
    '255/40ZR20(101Y)XL SC5P NO',
    '255/45R20 101W CSC5 SUV AO',
    '255/50R20 109V CSC5 SUV',
    '255/50R20 109V XL FR SC5 SUV',
    '255/50R20 109Y  UHP ##',
    '255/55R20 110W CSC5 SUV #',
    '265/35ZR21 101Y  CSC5P TO',
    '265/40R20 104Y CSC3 AO',
    '265/45R20 104W FR LXSP MGT',
    '265/45ZR20 104Y CSC2 MO',
    '265/45ZR20 108Y CSC5 MO',
    '265/50R20 111V XL FR UHP',
    '275/35R20 102Y CSC2  MO',
    '275/35R20 102Y CSC5P MO',
    '275/40R20 106W CSC5 SSR *',
    '275/40R20 106Y 4X4SC N0 #',
    '275/40R20 106Y CCUHP E LR',
    '275/40R20 106Y CSC5 SUV #',
    '275/45R20 110V CSC5 SSR',
    '275/45R20 110V XL CCLXSP NO',
    '275/45R20 110W UHP CS #',
    '275/45R20 110Y XL UC6 SUV #',
    '275/50R20 109W ML CCUHP MO',
    '285/35ZR20 104Y CSC5P MO',
    '285/45R20 112Y XL SC5 AO #',
    '285/45R20 112Y XL SC5 SUV AO',
]


cc5 = 'static/%E9%A9%AC%E7%89%8C-CC5.jpg'
uc6 = 'static/%E9%A9%AC%E7%89%8C-UC6.jpg'

brand = Brand.find_or_create_by(name: '德国马牌')

mapai_tire.each_with_index do |tire, index|
  tire = tire.upcase
  product = Product.new(name: '马牌 ' + tire, description: tire, available:true, price: 1)
  if tire.include?('CC5')
    product.images << Image.create(url: cc5)
  elsif tire.include?('UC6')
    product.images << Image.create(url: uc6)
  else
    next
  end
  product.brand = brand

  properties = Property.all
  properties.each do |p|
    case p.name
      when '轮胎品牌'
        product.product_properties.new(property_id: p.id, value: '德国马牌')
      when '产品规格'
        product.product_properties.new(property_id: p.id, value: tire.split(' ')[0])
      # when '轮胎花纹'
      #   product.product_properties.new(property_id: p.id, value: tire.split(' ')[1])
    end
  end

  product.position = index * 5
  product.save
end
=end

=begin

#邓禄普
denglupu_tire = [
    '195/65R15	VE302	91V',
    '205/55R16	VE302	91V',
    '205/60R15	VE302	91V',
    '205/65R15	VE302	94V',
    '215/55R16	VE302	93V',
    '215/55R17	VE302	93V',
    '215/60R16	VE302	95V',
    '225/60R16	VE302	98V',
    '225/50R17	VE302	94W',
    '225/55R16	VE302	95W',
    '225/55R17	VE302	97W',
    '235/45R17	VE302	94V',
    '235/50R17	VE302	96W',
    '235/60R16	VE302	100V',
    '245/45R18	VE302	96V',
    '235/50R19	MAXX050+ 99V',
    '235/55R19	MAXX050+	101W',
    '235/60R18 MAXX050+	107W',
    '235/65R17	MAXX050+	108V XL',
    '245/45R20 MAXX050+  99V ',
    '255/45R19 MAXX050+  100V ',
    '255/45R20 MAXX050+  101W ',
    '255/50R19 MAXX050+  107Y',
    '255/50R20 MAXX050+  109Y',
    '255/55R18 MAXX050+  109Y',
    '255/55R19 MAXX050+  111W ',
    '255/60R17	MAXX050+	110W XL',
    '255/60R18	MAXX050+	112W XL',
    '255/60R19	MAXX050+	109W',
    '265/50R19 MAXX050+  110Y',
    '275/45R20 MAXX050+  110Y',
    '275/55R19 MAXX050+  111W ',
    '195/65R15	R1	91H',
    '205/55R16	R1	91H',
    '205/60R15	R1	91H',
    '205/65R15	R1	94H',
    '215/55R16	R1	93H',
    '215/55R17	R1	94V',
    '215/60R16	R1	95H',
    '225/60R16	R1	98H',
]
ve302 = 'static/%E9%82%93%E7%A6%84%E6%99%AE-VE302.jpg'
r1 = 'static/%E9%82%93%E7%A6%84%E6%99%AE-R1.jpg'
maxx050 = 'static/%E9%82%93%E7%A6%84%E6%99%AE-MAXX050.jpg'

brand = Brand.find_or_create_by(name: '邓禄普')

denglupu_tire.each_with_index do |tire, index|
  tire = tire.upcase
  product = Product.new(name: '邓禄普 ' + tire, description: tire, available:true, price: 0.01)
  if tire.include?('VE302')
    product.images << Image.create(url: ve302)
  elsif tire.include?('MAXX050')
    product.images << Image.create(url: maxx050)
  else
    product.images << Image.create(url: r1)
  end
  product.brand = brand

  properties = Property.all
  properties.each do |p|
    case p.name
      when '轮胎品牌'
        product.product_properties.new(property_id: p.id, value: '邓禄普')
      when '产品规格'
        product.product_properties.new(property_id: p.id, value: tire.split(' ')[0])
      # when '轮胎花纹'
      #   product.product_properties.new(property_id: p.id, value: tire.split(' ')[1])
    end
  end

  product.position = index * 5
  product.save
end
=end

=begin
#普利司通
plst_tire = [
    '165/70R13	79H	TECHNO	RE',
    '175/60R13	77H	TECHNO	RE',
    '175/70R13	82H	B250	RE',
    '165/60R14	75H	TECHNO	RE',
    '165/70R14	81T	MW01	RE',
    '175/60R14	79H	TECHNO	RE',
    '175/65R14	82T	TECHNO	RE',
    '175/65R14	82T	EP150	OE',
    '175/70R14	84H	TECHNO	RE',
    '185/60R14	82H	EP150	RE',
    '185/65R14	86H	EP150	RE',
    '185/70R14	88H	TECHNO	RE',
    '185R14LT	102/100P	R623	RE',
    '195/60R14	86H	TECHNO	RE',
    '175/65R15	84H	EP150	RE',
    '185/55R15	82H	TECHNO	RE',
    '185/60R15	84H	TECHNO	RE',
    '185/60R15	84H	RE080	OE',
    '185/65R15	88H	EP150	RE',
    '195/50R15	82H	EP150	RE',
    '195/55R15	85H	TECHNO	RE',
    '195/60R15	88H	EP150	RE',
    '195/65R15	91H	EP150	RE',
    '195/70R15C	99S	RD-613	RE',
    '205/60R15	91H	EP150	RE',
    '205/55R16	91V	EP150	RE',
    '205/60R16	92V	EP150	RE',
    '205/65R16	95H	EP150	RE',
    '215/55R16	93V	EP150	RE',
    '215/60R16	95V	EP150	OE',
    '215/65R16	098H	EP850	RE',
    '215/65R16	098H	EP850	RE',
    '225/55R16	95V	EP150	RE',
    '225/60R16	98H	EP150	RE',
    '225/70R16	103H	EP850	RE',
    '235/60R16	100H	EP850	RE',
    '235/70R16	106H	EP850	RE',
    '245/70R16	107S	H/T 689	OE',
    '265/70R16	112S	A/T 698	RE',
    '265/70R16	112H	EP850	RE',
    '215/45R17	91V XL	EP150	RE',
    '215/50R17	95V	EP150	RE',
    '215/55R17	094V	EP150	RE',
    '215/55R17	94V	ER33	OE',
    '215/60R17	96H	EP850	RE',
    '225/45R17	91V	EP150	RE',
    '225/50R17	94V	ER33	OE',
    '225/50R17	98V XL	EP150	RE',
    '225/55R17	97W	T001	RE',
    '225/55R17	97Y	ER300 RFT	OE',
    '225/60R17	99H	EP850	RE',
    '225/65R17	102H	H/L 400	OE',
    '235/45R17	94V	EP150	RE',
    '235/50R17	96W	ER33	OE',
    '235/55R17	99H	EP850	RE',
    '235/65R17	104H	EP850	RE',
    '245/45R17	95W	RE050	RE',
    '245/45R17	95V	EP150	RE',
    '245/65R17	107H	EP850	RE',
    '265/65R17	112T	A/T 698	RE',
    '215/55R18	95H	H/L 400	OE',
    '225/40R18	92W	RE003	RE',
    '225/50R18	95V	H/L422+	OE',
    '235/45R18	94W	ER33	OE',
    '235/50R18	97H	EP850	RE',
    '235/55R18	100V	H/L 400	OE',
    '235/60R18	103H	H/L 422	OE',
    '235/65R18	106H	H/P SPORT	OE',
    '245/45R18	96Y	ER300 RFT	OE',
    '245/45R18	96V	EL400	OE',
    '255/55R18	109V	H/P SPORT	RE',
    '235/55R19	101V	EP850	RE',
    '245/55R19	103H	EP850	RE',
    '255/45R20	101V	H/P SPORT	OE',
    '255/45R20	101W	H/P SPORT	OE'
]

techno = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-TECHNO.jpg'
t001 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-T001.jpg'
re080 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-RE080.jpg'
re050 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-RE050.jpg'
rd_613 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-RD-613.jpg'
r623 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-R623.jpg'
mw01 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-MW01.jpg'

h_t_689 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-H%3AT%20689.jpg'
h_p_sport = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-H%3AP%20SPORT.JPG'
h_l_422 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-H%3AL%20422.jpg'
h_l_400 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-H%3AL%20400.jpg'
er33 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-ER33.jpg'
er300 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-ER300.jpg'
ep850 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-EP850.jpg'
ep150 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-EP150.jpg'
el400 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-EL400.jpg'
b250 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-B250.jpg'
a_t_698 = 'static/%E6%99%AE%E5%88%A9%E5%8F%B8%E9%80%9A-A%3AT%20698.png'


brand = Brand.find_or_create_by(name: '普利司通')

plst_tire.each_with_index do |tire, index|
  tire = tire.upcase
  product = Product.new(name: '普利司通 ' + tire, description: tire, available:true, price: 100)
  if tire.include?('TECHNO')
    product.images << Image.create(url: techno)
  elsif tire.include?('T001')
    product.images << Image.create(url: t001)
  elsif tire.include?('RE080')
    product.images << Image.create(url: re080)
  elsif tire.include?('RE050')
    product.images << Image.create(url: re050)
  elsif tire.include?('613')
    product.images << Image.create(url: rd_613)
  elsif tire.include?('623')
    product.images << Image.create(url: r623)
  elsif tire.include?('MW01')
    product.images << Image.create(url: mw01)
  elsif tire.include?('689')
    product.images << Image.create(url: h_t_689)
  elsif tire.include?('SPORT')
    product.images << Image.create(url: h_p_sport)
  elsif tire.include?('422')
    product.images << Image.create(url: h_l_422)
  elsif tire.include?('400') && tire.include?('H/L')
    product.images << Image.create(url: h_l_400)
  elsif tire.include?('ER33')
    product.images << Image.create(url: er33)
  elsif tire.include?('ER300')
    product.images << Image.create(url: er300)
  elsif tire.include?('EP850')
    product.images << Image.create(url: ep850)
  elsif tire.include?('EP150')
    product.images << Image.create(url: ep150)
  elsif tire.include?('EL400')
    product.images << Image.create(url: el400)
  elsif tire.include?('B250')
    product.images << Image.create(url: b250)
  elsif tire.include?('698')
    product.images << Image.create(url: a_t_698)
  else
    next
  end
  product.brand = brand

  properties = Property.all
  properties.each do |p|
    case p.name
      when '轮胎品牌'
        product.product_properties.new(property_id: p.id, value: '普利司通')
      when '产品规格'
        product.product_properties.new(property_id: p.id, value: tire.split(' ')[0])
      # when '轮胎花纹'
      #   product.product_properties.new(property_id: p.id, value: tire.split(' ')[1])
    end
  end

  product.position = index * 5
  product.save
end
=end

#玛吉斯
majishi_tire = [
    '165/70R13.735 79H 双层帘纱抗穿刺连续细沟防耐磨 静音操控耐磨',
    '165/70R14.918 81H 尼桑玛驰',
    '165R13C.168 8PR 94/93R',
    '165R14C.168 8PR 97/95N',
    '175/60R14.603 79H 奇瑞QQ',
    '175/65R14.360 82H',
    '175/65R15.360 84H',
    '175/70R14C.168 6PR 95/93S',
    '175/75R14C.168 8PR 99/98S',
    '175R14C.168 8PR 99/98N',
    '185/55R15.656 82V 长安CX20',
    '185/60R14.603 82H 雪佛兰乐驰乐风',
    '185/60R15.360 84H',
    '185/65R14.708 86H 凯越',
    '185/65R15.360 88H 新骐达',
    '185/70R14.718 88H',
    '185R14C.168 8PR 102/100R',
    '195R15C.MCV3 8PR 106/104R',
    '195/55R15.656 85V 别克新凯越',
    '195/60R14.656 86H 桑塔纳志俊',
    '195/60R15.360 88V 丰田花冠',
    '195/60R15.360 88V 丰田花冠',
    '195/65R15.656 91V 长安CX30',
    '205/55R16.510E 91V 致悦原配 对称型夏季花纹，排水操控优越',
    '205/60R16.656 92V 帅客 瑞麟',
    '205/70R15.603 96H',
    '215/45R17.M36 91W 江淮和悦',
    '215/55R16.501 93W 蒙迪欧致胜',
    '215/50R17.M3 91W',
    '215/55R16.651 93V 荣威550',
    '215/55R17.651 94V 帝豪EC8',
    '215/55R18.M3 95H 传祺GS4',
    '215/60R16.360 95H 铃木维特拉',
    '215/60R17.M3A 96H 传奇.长安',
    '215/65R16.501 98H 奇瑞1.6L 1.8L',
    '215/70R15.A16 98S 别克GL8',
    '225/45R18.HP5 95W.ZR',
    '225/45R17.HP5 91W.ZR',
    '225/50R17.360 94V',
    '225/55R16.510 95V',
    '225/55R17.510 97V 君威',
    '225/55R17.M36+ 防爆 97W.ZRF',
    '225/60R18.M3 100H 奇瑞瑞虎5',
    '225/65R17.510 102H 比亚迪',
    '235/60R17.656 102H 雪佛兰科帕奇',
    '235/65R17.771 104T 白字 江铃'
]
m168 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-168.jpg'
m360 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-360.jpg'
m501 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-501.jpg'
m510 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-510.jpg'
m510e = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-510E.jpg'
m603 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-603.jpg'
m651 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-651.jpg'
m656 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-656.jpg'
m708 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-708.jpg'
m718 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-718.jpg'
m735 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-735.jpg'
m771 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-771.png'
m918 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-918.jpg'
mA16 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-A16.jpg'
mHP5 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-HP5.jpg'
mM36p = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-M36%2B.jpg'
mM36 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-M36.jpg'
mM3 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-M3.jpg'
mM3A = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-M3A.jpg'
mMCV3 = 'static/%E7%8E%9B%E5%90%89%E6%96%AF-MCV3.jpg'


brand = Brand.find_or_create_by(name: '玛吉斯')

majishi_tire.each_with_index do |tire, index|
  tire = tire.upcase
  product = Product.new(name: '玛吉斯 ' + tire, available:true, price: 200)
  if tire.include?('168')
    product.images << Image.create(url: m168)
  elsif tire.include?('360')
    product.images << Image.create(url: m360)
  elsif tire.include?('501')
    product.images << Image.create(url: m501)
  elsif tire.include?('510')
    product.images << Image.create(url: m510)
  elsif tire.include?('510E')
    product.images << Image.create(url: m510e)
  elsif tire.include?('603')
    product.images << Image.create(url: m603)
  elsif tire.include?('651')
    product.images << Image.create(url: m651)
  elsif tire.include?('656')
    product.images << Image.create(url: m656)
  elsif tire.include?('708')
    product.images << Image.create(url: m708)
  elsif tire.include?('718')
    product.images << Image.create(url: m718)
  elsif tire.include?('735')
    product.images << Image.create(url: m735)
  elsif tire.include?('771')
    product.images << Image.create(url: m771)
  elsif tire.include?('918')
    product.images << Image.create(url: m918)
  elsif tire.include?('A16')
    product.images << Image.create(url: mA16)
  elsif tire.include?('HP5')
    product.images << Image.create(url: mHP5)
  elsif tire.include?('M36+')
    product.images << Image.create(url: mM36p)
  elsif tire.include?('M36')
    product.images << Image.create(url: mM36)
  elsif tire.include?('M3A')
    product.images << Image.create(url: mM3A)
  elsif tire.include?('M3')
    product.images << Image.create(url: mM3)
  elsif tire.include?('MCV3')
    product.images << Image.create(url: mMCV3)
  else
    next
  end
  product.brand = brand

  properties = Property.all
  properties.each do |p|
    case p.name
      when '轮胎品牌'
        product.product_properties.new(property_id: p.id, value: '玛吉斯')
      when '产品规格'
        product.product_properties.new(property_id: p.id, value: tire.split('.')[0])
      # when '轮胎花纹'
      #   product.product_properties.new(property_id: p.id, value: tire.split(' ')[1])
    end
  end

  product.position = index * 5
  product.save
end

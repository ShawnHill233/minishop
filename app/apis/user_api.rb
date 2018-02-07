class UserAPI < Grape::API

  resources :users do
    desc '登录'
    post :login do
      puts "code is: #{params[:code]}"
      puts "appid is: #{Settings.wx_appid}"
      response = Unirest.get("https://api.weixin.qq.com/sns/jscode2session?appid=#{Settings.wx_appid}&secret=#{Settings.wx_secret}&js_code=#{params[:code]}&grant_type=authorization_code")
      puts "resonse is: #{response.body}"
      openid = response.body['openid']
      if openid.present?
        User.where(openid: openid).first_or_create!
        status 200
        present token: openid
      else
        error!('登录失败', 401)
      end
    end

    desc '获取个人信息'
    get :info do
      present :name => current_user.name, :mobile => current_user.mobile, :vehicle_type => current_user.vehicle_type
    end
    desc '修改个人信息'
    params do
      requires :name, type: String, desc: '姓名'
      requires :mobile, type: String, desc: '手机号'
      requires :vehicle_type, type: String, desc: '车型'
    end
    post :info do
      current_user.update(name: params[:name], mobile: params[:mobile], vehicle_type: params[:vehicle_type])
      success_response
    end

  end
end

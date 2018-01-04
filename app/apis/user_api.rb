class UserAPI < Grape::API

  resources :users do
    desc '登录'
    post :login do
      puts "code is: #{params[:code]}"
      puts "appid is: #{Settings.wx_appid}"
      response = Unirest.get("https://api.weixin.qq.com/sns/jscode2session",
                             parameters: {appid: Settings.wx_appid, secret: Settings.wx_secret,
                                          js_code: params[:code], grant_type: 'authorization_code'})
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

  end
end

class API < Grape::API
  format :json
  content_type :json, 'application/json;charset=UTF-8'

  helpers do
    def success_response
      status 200
      present({success: true}, with: Entities::Success)
    end

    def current_user
      token = request.headers["X-Auth-Token"]
      openid = token
      puts "openid is: #{openid}"
      @user ||= User.find_by(openid: openid)

      if @user.nil?
        error!('认证失败', 401)
      else
        @user
      end
    end
  end

  mount API::HomePageAPI
  mount API::ProductAPI
  mount API::BrandAPI
  mount API::CartAPI
  mount API::UserAPI
  mount API::OrderAPI
end
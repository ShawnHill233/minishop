module Admin
  class SessionsController < AdminController
    def new
    end

    def create
      admin_user = Admin::User.find_by(email: params[:session][:email].downcase)
      if admin_user && admin_user.authenticate(params[:session][:password])
        # 登入用户，然后重定向到用户的资料页面
        flash.now[:success] = '登录成功'
        render 'new'
      else
        flash.now[:danger] = '邮箱或密码错误'
        render 'new'
      end
    end
  end

end

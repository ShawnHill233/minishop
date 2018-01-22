class FeedbackAPI < Grape::API

  resources :feedback do

    desc '提交反馈'
    params do
      requires :cate, type: String, desc: '类别'
      requires :content, type: String, desc: '姓名'
      optional :mobile, type: String, desc: '手机号'
    end
    post do
      Feedback.create(cate: params[:cate], content: params[:content], mobile: params[:mobile])
      success_response
    end

    desc '修改个人信息'
    params do
      requires :name, type: String, desc: '姓名'
      requires :mobile, type: String, desc: '手机号'
    end
    post :info do
      current_user.update(name: params[:name], mobile: params[:mobile])
      success_response
    end

  end
end

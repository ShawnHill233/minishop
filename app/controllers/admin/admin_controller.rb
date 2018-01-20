class Admin::AdminController < ApplicationController
  layout 'admin/application'
  before_action :authenticate_admin_user!

  private
  def set_aliyun_upload
    gon.aliyun_access_key_id = Settings.aliyun_access_key_id
    gon.aliyun_access_key_secret = Settings.aliyun_access_key_secret
  end

end

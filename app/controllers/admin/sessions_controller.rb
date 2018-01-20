module Admin
  class SessionsController < Devise::SessionsController

    # def after_sign_in_path_for(admin_user)
    #   from, url = params[:from], params[:url]
    #   if from.present? && url.present?
    #     internal_system = InternalSystem.where(code: from).first
    #     if internal_system.present?
    #       param = "st=#{internal_system.generate_sso_token_for_admin(admin_user, 3.minutes)}"
    #       append = url.include?('?') ? "&#{param}" : "?#{param}"
    #       @redirects_to = "#{url}#{append}"
    #     end
    #   end
    #   @redirects_to || admin_root_path
    # end
    #
    # def after_sign_out_path_for(resource)
    #   new_admin_user_session_path
    # end
  end

end

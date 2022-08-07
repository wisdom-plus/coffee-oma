ActiveAdmin::Devise::SessionsController.class_eval do
  def after_sign_in_path_for(resource)
    if resource.is_a?(AdminUser)
      admin_root_path
    else
      products_path
    end
  end
end

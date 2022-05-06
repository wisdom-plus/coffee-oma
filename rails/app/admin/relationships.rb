ActiveAdmin.register Relationship do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :follow_id
  #
  # or
  #
  permit_params do
    permitted = [:user_id, :follow_id]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end

end

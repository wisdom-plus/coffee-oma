ActiveAdmin.register Report do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :review_type, :review_id
  #
  # or
  #

  index do
    column :id
    column :review_type
    column :user_id
    column :review_id
    column :created_at
    actions
  end


  permit_params do
    permitted = %i[user_id review_type review_id]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

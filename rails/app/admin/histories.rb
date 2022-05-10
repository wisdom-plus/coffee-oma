ActiveAdmin.register History do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :bean_id, :product_id
  #
  # or
  #

  index do
    column :id
    column :user_id
    column :product_id
    column :bean_id
    column :created_at
    column :updated_at
    actions
  end
  permit_params do
    permitted = %i[user_id bean_id product_id]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

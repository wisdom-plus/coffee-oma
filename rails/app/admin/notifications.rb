ActiveAdmin.register Notification do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :visitor_id, :visited_id, :action, :checked, :message_id, :like_id
  #
  # or
  #
  index do
    column :id
    column :visited_id
    column :visitor_id
    column :action
    column :checked
    column :like_id
    column :message_id
    column :created_at
    column :updated_at
    actions
  end

  show do |notification|
    attributes_table(*notification.class.columns.collect { |column| column.name.to_sym })
    active_admin_comments
  end

  permit_params do
    permitted = %i[visitor_id visited_id action checked message_id like_id]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

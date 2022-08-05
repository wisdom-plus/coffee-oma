ActiveAdmin.register Notification do # rubocop:disable Metrics/BlockLength
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :action, :checked, :source_type, :source_id
  #
  # or
  #
  index do
    column :id
    column :user_id
    column :source_id
    column :source_type
    column :checked
    column :created_at
    actions
  end

  show do |notification|
    attributes_table(*notification.class.columns.collect { |column| column.name.to_sym })
    active_admin_comments
  end

  form do |f|
    f.inputs 'Details', multipart: true do
      f.input :user_id
      f.input :checked
      f.input :source_type
      f.input :source_id
    end
    f.actions
  end

  permit_params do
    permitted = %i[user_id checked source_id source_type]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

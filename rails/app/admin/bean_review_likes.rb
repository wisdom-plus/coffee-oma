ActiveAdmin.register BeanReviewLike do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :type, :liked_id
  #
  # or
  #
  menu parent: 'お気に入り'

  show do |bean_review_like|
    attributes_table(*bean_review_like.class.columns.collect { |column| column.name.to_sym })
    panel 'ユーザー' do
      table_for bean_review_like.user do
        column :id
        column :username
        column :created_at
      end
    end
    active_admin_comments
  end
  permit_params do
    permitted = %i[user_id type liked_id]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

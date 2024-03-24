ActiveAdmin.register Product do # rubocop:disable Metrics/BlockLength
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  #
  # or
  #
  permit_params do
    permitted = %i[name price images url caption tag_list user_id]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
  end

  show do |product|
    attributes_table(*product.class.columns.collect { |column| column.name.to_sym })
    panel 'レビュー' do
      table_for product.reviews do
        column :id
        column :user_id
        column :title
        column :rate
        column :content
      end
    end
# :nocov:
    panel 'お気に入り' do
      table_for product.product_likes do
        column :id
        column 'ユーザー名' do |product_like|
          product_like.user.username
        end
      end
    end
    active_admin_comments
  end
# :nocov:
  index do
    selectable_column
    column :id
    column :name
    column :price
    column :caption
    column :rate_sum
    column :likes_count
    column :reviews_count
    column :created_at
    column :updated_at
    actions
  end

  filter :id, as: :numeric
  filter :name, as: :string
  filter :price, as: :numeric

  form do |f|
    f.inputs 'Details', multipart: true do
      f.input :user_id
      f.input :name
      f.input :price
      f.input :images
      f.input :url
      f.input :caption
      f.input :tag_list
    end
    f.actions
  end
end

ActiveAdmin.register Review do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :product_id, :title, :content, :rate
  #
  # or
  #
  menu parent: 'レビュー'

  index do
    column :id
    column :title
    column :rate
    column :content
    column :reviewlikes_count
    column :created_at
    column :updated_at
    actions
  end

  show do |review|
    attributes_table(*review.class.columns.collect { |column| column.name.to_sym })
    panel 'お気に入り' do
      table_for review.product_review_likes do
        column :id
        column 'ユーザー名' do |like|
          like.user.username
        end
        column :created_at
      end
    end

    panel '商品' do
      table_for review.product do
        column :id
        column :itemname
        column :itemprice
        column :shopname
        column :itemcaption
      end
    end
  end

  permit_params do
    permitted = %i[user_id product_id title content rate]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

ActiveAdmin.register Bean do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :roast, :url, :purification, :country, :area, :description, :user_id, :image
  #
  # or
  #
  index do
    column :id
    column :name
    column :country
    column :area
    column :description
    column :purification
    column :roast
    column :likes_count
    column :reviews_count
    column :created_at
    column :updated_at
    actions
  end

  show do |bean|
    attributes_table(*bean.class.columns.collect { |column| column.name.to_sym })
    panel 'レビュー' do
      table_for bean.bean_reviews do
        column :id
        column :user_id
        column :title
        column :content
      end
    end
    active_admin_comments
  end

  permit_params do
    permitted = %i[name roast url purification country area description user_id image]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

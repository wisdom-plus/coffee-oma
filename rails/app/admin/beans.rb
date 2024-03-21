ActiveAdmin.register Bean do # rubocop:disable Metrics/BlockLength
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :roast, :url, :purification, :country, :area, :description, :user_id, :image
  #
  # or
# :nocov:
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

  filter :id, as: :numeric
  filter :name, as: :string
  filter :country, as: :string
  filter :area, as: :string
  filter :purification, as: :string
  filter :roast, as: :string

# :nocov:
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
# :nocov:
    panel 'お気に入り' do
      table_for bean.bean_likes do
        column :id
        column 'ユーザー名' do |bean_like|
          bean_like.user.username
        end
      end
    end
    active_admin_comments
  end
# :nocov:
  permit_params do
    permitted = %i[name roast url purification country area description user_id image]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

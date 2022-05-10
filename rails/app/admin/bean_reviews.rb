ActiveAdmin.register BeanReview do # rubocop:disable Metrics/BlockLength
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :acidity, :sweet, :rich, :bitter, :flavor, :bean_id, :user_id, :title, :content
  #
  # or
  #
  menu parent: 'レビュー'

  index do
    column :id
    column :title
    column :content
    column :acidity
    column :bitter
    column :flavor
    column :rich
    column :sweet
    column :reviewlikes_count
    column :created_at
    actions
  end

  show do |review| # rubocop:disable Metrics/BlockLength
    attributes_table(*review.class.columns.collect { |column| column.name.to_sym })
    panel 'お気に入り' do
      table_for review.bean_review_likes do
        column :id
        column 'ユーザー名' do |like|
          like.user.username
        end
        column :created_at
      end
    end

    panel '商品' do
      table_for review.bean do
        column :id
        column :name
        column :country
        column :area
        column :purification
        column :roast
        column :description
        column :created_at
      end
    end

    panel 'レシピ' do
      table_for review.recipe do
        column :id
        column :amount
        column :grinding
        column :powdergram
        column :temprerature
        column :time
        column :created_at
      end
    end
    active_admin_comments
  end

  permit_params do
    permitted = %i[acidity sweet rich bitter flavor bean_id user_id title content]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

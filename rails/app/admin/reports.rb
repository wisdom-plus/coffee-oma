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

  show do |report|
    attributes_table(*report.class.columns.collect { |column| column.name.to_sym })
    panel 'ユーザー' do
      table_for report.user do
        column :id
        column 'ユーザー名' do |user|
          user.username
        end
        column :created_at
      end
    end

    if report.review_type == 'Review'
      panel '商品レビュー' do
        table_for report.review.product do
          column :id
          column :itemname
          column :itemprice
          column :shopname
          column :itemcaption
        end
      end
    else
      panel 'コーヒー豆レビュー' do
        table_for report.review.bean do
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
    end
    active_admin_comments
  end

  permit_params do
    permitted = %i[user_id review_type review_id]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

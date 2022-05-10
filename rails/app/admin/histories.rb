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

  show do |history|
    attributes_table(*history.class.columns.collect { |column| column.name.to_sym })
    panel 'ユーザー' do
      table_for history.user do
        column :id
        column 'ユーザー名', &:username
        column :created_at
      end
    end
    if history.product.present?
      panel '商品' do
        table_for history.product do
          column :id
          column :itemname
          column :itemprice
          column :shopname
          column :itemcaption
        end
      end
    else
      panel 'コーヒー豆' do
        table_for history.bean do
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
    permitted = %i[user_id bean_id product_id]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

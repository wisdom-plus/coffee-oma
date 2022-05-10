ActiveAdmin.register User do # rubocop:disable Metrics/BlockLength
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email,
  #               :encrypted_password,
  #               :reset_password_token,
  #               :reset_password_sent_at,
  #               :remember_created_at,
  #               :confirmation_token,
  #               :confirmed_at,
  #               :confirmation_sent_at,
  #               :unconfirmed_email,
  #               :username,
  #               :profile,
  #               :icon
  #
  # or
  #
  index do
    selectable_column
    column :id
    column :email
    column :username
    column 'レビュー件数' do |user|
      user.reviews.count + user.bean_reviews.count
    end
    column 'フォロー数' do |user|
      user.followings.count
    end
    column :reset_password_sent_at
    column :remember_created_at
    column :confirmed_at
    column :confirmation_sent_at
    column :unconfirmed_email
    column :created_at
    column :updated_at
    actions
  end

  show do |user| # rubocop:disable Metrics/BlockLength
    attributes_table(*user.class.columns.collect { |column| column.name.to_sym })
    panel 'フォロー' do
      table_for user.followings do
        column :id
        column :username
      end
    end

    panel 'レビュー' do
      table_for user.reviews do
        column :id
        column :product_id
        column :title
        column :rate
        column :content
      end
    end

    panel 'コーヒー豆レビュー' do
      table_for user.bean_reviews do
        column :id
        column :bean_id
        column :title
        column :content
      end
    end

    panel 'お気に入り' do
      table_for user.likes do
        column :id
        column :type
        column :liked_id
        column :created_at
      end
    end
    active_admin_comments
  end
  permit_params do
    permitted = %i[email
                   encrypted_password
                   reset_password_token
                   reset_password_sent_at
                   remember_created_at
                   confirmation_token
                   confirmed_at
                   confirmation_sent_at
                   unconfirmed_email
                   username
                   profile
                   icon
                   id
                   created_at
                   updated_at]
    permitted << :other if params[:action] == 'create' && admin_user_signed_in?
    permitted
  end
end

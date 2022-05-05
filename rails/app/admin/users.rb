ActiveAdmin.register User do
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

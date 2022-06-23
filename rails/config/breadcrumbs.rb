crumb :root do
  link 'Home', root_path
end

crumb :product do
  link 'アイテム一覧', products_path
  parent :root
end

crumb :product_new do
  link 'アイテムの登録', new_product_path
  parent :product
end

crumb :product_show do |product|
  link product.name, product_path(product.id)
  parent :product
end

crumb :bean do
  link '豆一覧', beans_path
  parent :root
end

crumb :bean_new do
  link '豆の登録', new_bean_path
  parent :bean
end

crumb :bean_show do |bean|
  link bean.name, bean_path(bean.id)
  parent :bean
end

crumb :room do
  link 'メッセージ一覧', rooms_path
  parent :root
end

crumb :message do |room|
  link 'メッセージ', room_path(room.id)
  parent :room
end

crumb :contact do
  link 'お問い合わせ', new_contact_path
  parent :root
end

crumb :session do
  link 'ログイン', new_user_session_path
  parent :root
end

crumb :sign_in do
  link '新規登録', new_user_registration_path
  parent :root
end

crumb :password_edit do
  link 'パスワード変更', edit_user_password_path
  parent :root
end

crumb :password_new do
  link 'パスワードの再設定', new_user_password_path
  parent :root
end

crumb :confirmation do
  link '確認メール', new_user_confirmation_path
  parent :root
end

crumb :user_edit do
  link 'ユーザーを編集', edit_user_registration_path
  parent :root
end

crumb :profile do |user|
  link 'プロフィール', "/users/#{user.id}/show"
  parent :root
end

crumb :history do
  link '履歴', histories_path
  parent :root
end

crumb :news do
  link 'お知らせ', news_index_path
end

crumb :notification do
  link '通知', notifications_path
end

crumb :ranking do
  link 'ランキング', likes_path
end

crumb :policy do
  link '利用規約', policy_path
end

crumb :private do
  link 'プライベートポリシー', private_policy_path
end

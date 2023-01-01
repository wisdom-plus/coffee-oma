module LoginHelper
  def login(user, email, password)
    user.confirm
    visit new_user_session_path
    fill_in 'E-mail address', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  def admin_login(user)
    visit new_admin_user_session_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'
  end

  def gest_login
    visit new_user_session_path
    find_by_id('guest_login_button').click
  end
end

module LoginHelper
  def login(user, email, password)
    user.confirm
    visit new_user_session_path
    fill_in 'E-mail address', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end

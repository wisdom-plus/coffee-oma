require 'rails_helper'

RSpec.describe 'Relationships', js: true do
  let(:user) { create(:user) }
  let(:user1) { create(:user, :other_user) }
  let(:follow) { create(:relationship, user: user, follow: user1) }

  context 'when login' do
    before do
      login(user, user.email, user.password)
    end

    context 'create' do
      it 'created relationship render follow' do
        visit user_registration_show_path(user1.id)
        click_link 'フォローする'
        expect(page).to have_content "#{user1.username}をフォローしました"
        expect(page).to have_link 'フォロー解除'

        visit user_registration_show_path(user.id)
        expect(page).not_to have_link 'フォローする'
      end
    end

    context 'destroy' do
      it 'destroy relationship' do
        follow
        visit user_registration_show_path(user1.id)
        click_link 'フォロー解除'
        expect(page).to have_content "#{user1.username}のフォローを解除しました"
        expect(page).to have_link 'フォローする'

        visit user_registration_show_path(user.id)
        expect(page).not_to have_link 'フォロー解除'
      end
    end
  end

  context 'when not login' do
    it 'is displayed follow button' do
      visit user_registration_show_path(user1.id)
      expect(page).not_to have_link 'フォローする'
    end
  end
end

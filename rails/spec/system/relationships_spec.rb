require 'rails_helper'

RSpec.describe 'Relationships', type: :system, js: true do
  let(:user) { create(:user) }
  let(:user1) { create(:user, username: 'test1', email: 'test1@example.com') }
  let(:follow) { create(:relationship, user: user, follow: user1) }

  context 'when login' do
    before do
      login(user, user.email, user.password)
    end

    context 'create' do
      it 'created relationship' do
        visit "/users/#{user1.id}/show"
        click_link 'フォローする'
        expect(page).to have_link 'フォロー解除'
      end

      it 'not render link' do
        visit "/users/#{user.id}/show"
        expect(page).to have_no_link 'フォローする'
      end
    end

    context 'destroy' do
      before do
        follow
      end

      it 'destroy relationship' do
        visit "/users/#{user1.id}/show"
        click_link 'フォロー解除'
        expect(page).to have_link 'フォローする'
      end

      it 'not render link' do
        visit "/users/#{user.id}/show"
        expect(page).to have_no_link 'フォロー解除'
      end
    end
  end

  context 'when not login' do
    it 'is displayed follow button' do
      visit "/users/#{user1.id}/show"
      expect(page).to have_no_link 'フォローする'
    end
  end
end

require 'rails_helper'

RSpec.desctibe 'Admin dashboard', type: :system do
  let(:admin) { create(:admin)}

  describe 'dashboard' do
    before do
      admin_login(admin)
      visit admin_root_path
    end

    it 'display dashborad' do
      expect(page).to have_content 'ダッシュボード'
      expect(page).to have_current_path admin_root_path
    end
  end
end
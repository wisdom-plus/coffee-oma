require 'rails_helper'

RSpec.describe 'Contacts', type: :system do
  let(:contact) { create(:contact) }
  let(:contact_params) { attributes_for(:contact) }

  describe 'contact' do
    describe 'new' do
      before do
        visit new_contact_path
      end

      it 'render page' do
        expect(page).to have_content 'お問い合わせ'
      end

      it 'created contact' do
        fill_in 'お名前', with: contact.name
        fill_in 'メールアドレス',	with: contact.email
        fill_in 'contact[content]',	with: contact.content
        click_on '送信'
        expect(page).to have_content 'お問い合わせメールが送信されました'
      end

      it 'redirect root' do
        fill_in 'お名前', with: contact.name
        fill_in 'メールアドレス',	with: contact.email
        fill_in 'contact[content]',	with: contact.content
        click_on '送信'
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'Contacts', type: :system do
  let(:contact) { build_stubbed(:contact) }
  let(:contact_params) { attributes_for(:contact) }

  describe 'new' do
    context 'when to succeed' do
      it 'created contact' do
        visit new_contact_path
        fill_in 'お名前', with: contact.name
        fill_in 'メールアドレス',	with: contact.email
        fill_in 'contact[content]',	with: contact.content
        click_on 'send'
        expect(page).to have_content 'お問い合わせメールが送信されました'
      end

      it 'redirect root' do
        visit new_contact_path
        fill_in 'お名前', with: contact.name
        fill_in 'メールアドレス',	with: contact.email
        fill_in 'contact[content]',	with: contact.content
        click_on 'send'
        expect(page).to have_current_path root_path, ignore_query: true
      end
    end

    context 'when to fail' do
      it 'is blank name' do
        visit new_contact_path
        fill_in 'お名前', with: ''
        fill_in 'メールアドレス',	with: contact.email
        fill_in 'contact[content]',	with: contact.content
        click_on 'send'
        expect(page).to have_content 'お問い合わせメールの送信に失敗しました'
      end

      it 'is blank email' do
        visit new_contact_path
        fill_in 'お名前', with: contact.name
        fill_in 'メールアドレス',	with: ''
        fill_in 'contact[content]',	with: contact.content
        click_on 'send'
        expect(page).to have_content 'お問い合わせメールの送信に失敗しました'
      end

      it 'is blank content' do
        visit new_contact_path
        fill_in 'お名前', with: contact.name
        fill_in 'メールアドレス',	with: contact.email
        fill_in 'contact[content]',	with: ''
        click_on 'send'
        expect(page).to have_content 'お問い合わせメールの送信に失敗しました'
      end
    end
  end
end

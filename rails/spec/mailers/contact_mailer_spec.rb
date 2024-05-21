require 'rails_helper'

RSpec.describe ContactMailer do
  let_it_be(:contact) { create(:contact) }

  describe 'contact_mail' do
    subject(:mail) do
      mail = ContactMailer.with(contact: contact).contact_mail
      Premailer::Rails::Hook.perform(mail)
    end

    it 'send mail' do
      expect(mail.from.first).to eq('noreply@coffee-oma.com')
      expect(mail.to.first).to eq(ENV.fetch('MY_MAILADRESS', nil))
      expect(mail.subject).to eq('お問い合わせ通知')
      expect(mail.html_part.body.raw_source).to include('これは問合せメールの本文が入ります')
      expect(mail.text_part.body.raw_source).to include('これは問合せメールの本文が入ります')
    end
  end

  describe 'reply_mail' do
    subject(:mail) do
      ContactMailer.with(contact: contact).reply_mail.deliver_now
      ActionMailer::Base.deliveries.last
    end

    it 'send mail' do
      expect(mail.from.first).to eq('noreply@coffee-oma.com')
      expect(mail.to.first).to eq('test@example.com')
      expect(mail.subject).to eq('お問い合わせありがとうございます')
      expect(mail.html_part.body.raw_source).to include('これは問合せメールの本文が入ります')
      expect(mail.text_part.body.raw_source).to include('これは問合せメールの本文が入ります')
    end
  end
end

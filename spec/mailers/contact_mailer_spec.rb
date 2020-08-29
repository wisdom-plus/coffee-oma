require "rails_helper"

RSpec.describe ContactMailer, type: :mailer do
  let(:contact) {create(:contact)}

  describe 'contact' do
    context 'contact_mail' do
      subject(:mail) do
        ContactMailer.contact_mail(contact).deliver_now
        mail = ActionMailer::Base.deliveries.last
      end

      it 'send mail' do
        expect(mail.from.first).to eq('system@example.com')
        expect(mail.to.first).to eq(ENV['MY_MAILADRESS'])
        expect(mail.subject).to eq('お問い合わせ通知')
        expect(mail.body).to match('これは問合せメールの本文が入ります')
      end
    end

    context 'reply_mail' do
      subject(:mail) do
        ContactMailer.reply_mail(contact).deliver_now
        mail = ActionMailer::Base.deliveries.last
      end

      it 'send mail' do
        expect(mail.from.first).to eq('system@example.com')
        expect(mail.to.first).to eq('test@example.com')
        expect(mail.subject).to eq('お問い合わせありがとうございます')
        expect(mail.body).to match('これは問合せメールの本文が入ります')
      end
    end
  end
end

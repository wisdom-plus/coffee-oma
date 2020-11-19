class ContactMailer < ApplicationMailer
  default from: 'system@example.com'

  def contact_mail(contact)
    @contact = contact
    mail(
      to: ENV['MY_MAILADRESS'],
      subject: 'お問い合わせ通知'
    )
  end

  def reply_mail(contact)
    @contact = contact
    mail(
      to: @contact.email,
      subject: 'お問い合わせありがとうございます'
    )
  end
end

class ContactMailer < ApplicationMailer

  def contact_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      to: ENV[MY_MAILADRESS],
      subject: 'お問い合わせ通知'
    )
  end

  def reply_mail(contact)
    @contact = contact
    mail(
      from: 'system@example.com',
      to: @contact.email
      subject: 'お問い合わせありがとうございます'
    )
  end


end

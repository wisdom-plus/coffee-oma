class ContactMailer < ApplicationMailer
  default from: 'noreply@coffee-oma.com'

  def contact_mail
    @contact = params[:contact]
    mail(
      to: ENV['MY_MAILADRESS'],
      subject: 'お問い合わせ通知'
    )
  end

  def reply_mail
    @contact = params[:contact]
    mail(
      to: @contact.email,
      subject: 'お問い合わせありがとうございます'
    )
  end
end

class ContactMailer < ApplicationMailer
  default from: 'noreply@coffee-oma.com'

  def contact_mail
    @contact = params[:contact]
    mail(
      to: ENV.fetch('MY_MAILADRESS', nil)
    )
  end

  def reply_mail
    @contact = params[:contact]
    mail(
      to: @contact.email
    )
  end
end

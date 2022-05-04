class ContactMailer < ApplicationMailer
  default from: 'noreply@coffee-oma.com'

  def contact_mail
    @contact = params[:contact]
    mail(
      to: ENV['MY_MAILADRESS']
    )
  end

  def reply_mail
    @contact = params[:contact]
    mail(
      to: @contact.email
    )
  end
end

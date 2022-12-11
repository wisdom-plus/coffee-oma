class ContactMailer < ApplicationMailer
  def contact_mail
    @contact = params[:contact]
    mail(
      to: ENV.fetch('MY_MAILADRESS')
    )
  end

  def reply_mail
    @contact = params[:contact]
    mail(
      to: @contact.email
    )
  end
end

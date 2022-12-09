class ContactMailer < ApplicationMailer
  def contact_mail
    @contact = params[:contact]
    mail(
      to: ENV.fetch('MY_MAILADRESS', subject: '問い合わせメール')
    )
  end

  def reply_mail
    @contact = params[:contact]
    mail(
      to: @contact.email, subject: '問い合わせ'
    )
  end
end

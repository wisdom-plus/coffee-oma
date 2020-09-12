class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      ContactMailer.contact_mail(contact).deliver
      ContactMailer.reply_mail(contact).deliver
      redirect_to root_path, notice: 'お問い合わせメールが送信されました'
    else
      render :new, alert: "お問い合わせメールの送信し失敗しました"
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end

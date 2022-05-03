class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.with(contact: @contact).delay.contact_mail
      ContactMailer.with(contact: @contact).delay.reply_mail
      redirect_to root_path, notice: t('.notice')
    else
      flash.now[:alert] = t('.alert')
      render :new
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.with(contact: @contact).contact_mail.deliver_later
      ContactMailer.with(contact: @contact).reply_mail.deliver_later
      redirect_to root_path, notice: t('.notice'), status: :see_other
    else
      flash.now[:alert] = t('.alert')
      render :new, status: :unprocessable_entity
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end

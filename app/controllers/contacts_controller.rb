class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def created
    @contact = Contact.new(params[:id])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = "Request was sent!"
    else
      flash.now[:error] = "Cannot send message."
      render :new
    end
  end
end

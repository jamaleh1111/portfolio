class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = "Request was sent!"
    else
      flash.now[:notice] = "Cannot send message."
      render :new
    end
  end
end

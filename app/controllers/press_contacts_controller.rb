class PressContactsController < ApplicationController
  def new
    @presscontact = PressContact.new
  end

  def create
    @presscontact = PressContact.new(params[:presscontact])
    @presscontact.request = request
    if @presscontact.deliver!
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end
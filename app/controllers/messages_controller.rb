class MessagesController < ApplicationController
  def create
    message = Message.new
    message.content = params[:message]
    message.user = current_user
    dest = Destination.find_by_country(params[:country])
    message.destination = dest
    message.save
    redirect_to :back
  end

  def edit
  end

  def destroy
  end

end

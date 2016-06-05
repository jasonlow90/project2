class MessagesController < ApplicationController
  def create
    message = Message.new
    message.content = params[:content]
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

  def update
    message = Message.find_by_id(params[:message][:id])
    message.update_attributes(update_params)
    redirect_to '/profiles'
  end

  def update_params
    params.require(:message).permit(:content)
  end
end

class MessagesController < ApplicationController
  def create
    message = Message.new
    message.content = params[:message]
    message.user = current_user
    dest = Destination.find_by_country(country: params[:searchterm])
    message.destination_id = dest.id
    redirect_to "/destinations/show?searchterm=#{params[:searchterm]}"
  end

  def edit
  end

  def destroy
  end
end

class DestinationsController < ApplicationController
  def home
  end

  ## To save a searched destination under the user
  def create
    @response = HTTParty.get("https://travelbriefing.org/#{params[:name]}?format=json",
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})

    @response = JSON.parse(@response.parsed_response)

    destination = Destination.new
    destination.country = @response["names"]["name"]
    destination.user = current_user
    destination.save
    redirect_to '/profiles'
  end

  ## To show
  def show
    @response = HTTParty.get("https://travelbriefing.org/#{params[:name]}?format=json",
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})

    @response = JSON.parse(@response.parsed_response)

    @dest = Destination.where(country: params[:name], user_id: current_user.id)[0]

    @message = Message.all
    @destination = Destination.all

    @currency = @response["currency"]["rate"].to_f/@response["currency"]["compare"][5]["rate"].to_f

    gon.currency = @currency
  end

  # To access other user's saved destination
  def view
    @response = HTTParty.get("https://travelbriefing.org/#{params[:name][:country]}?format=json",
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})

    @response = JSON.parse(@response.parsed_response)

    @dest = Destination.where(country: params[:name][:country], user_id: params[:name][:userid])[0]

    @message = Message.all
    @destination = Destination.all

    @currency = @response["currency"]["rate"].to_f/@response["currency"]["compare"][5]["rate"].to_f

    gon.currency = @currency
  end

end

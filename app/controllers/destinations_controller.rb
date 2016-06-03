class DestinationsController < ApplicationController
  def home
  end

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

  def show
    @response = HTTParty.get("https://travelbriefing.org/#{params[:searchterm]}?format=json",
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})

    @response = JSON.parse(@response.parsed_response)

  end

end

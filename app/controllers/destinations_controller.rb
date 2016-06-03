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
    # if current_user.destinations.country == destination.country
    #   flash[:error] = "Destination exist"
    # else
      destination.save
    # end
    redirect_to '/profiles'
  end

  def show
    @response = HTTParty.get("https://travelbriefing.org/#{params[:searchterm]}?format=json",
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})

    @response = JSON.parse(@response.parsed_response)

    @dest = Destination.where(country: params[:searchterm], user_id: current_user.id)[0]
    # @dest_test = Destination.find_by_country(params[:searchterm])
    #
    # if @dest_test.user.id == current_user.id
    #   @dest = @dest_test
    # end

    @message = Message.all
    @destination = Destination.all

  end

end

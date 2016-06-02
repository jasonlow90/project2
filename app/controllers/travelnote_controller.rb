class TravelnoteController < ApplicationController

  def index
    if current_user && current_user.profile.nil?
        redirect_to :action => 'new'
      end

  end

  def new

  end

  def create
    if current_user.profile.nil?
      profile = Profile.new(profile_params)
      profile.user = current_user
      if profile.save
        redirect_to travelnote_path
        return
      end
    end
    redirect_to travelnote_path
  end

  def search
    @response = HTTParty.get('https://travelbriefing.org/Thailand?format=json',
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})

    @response = JSON.parse(@response.parsed_response)


  end

  def profile_params
    params.require(:profile).permit(:name, :countries_visited, :favourite_countries, :bucket_list, :travel_buddy)
  end
end

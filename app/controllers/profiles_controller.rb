class ProfilesController < ApplicationController

    def index
      # If the user has no profile, redirect them to make a new profile
      if current_user && current_user.profile.nil?
          redirect_to :action => 'new'
          return
        end

      @destinations = Destination.all

    end

    def new

    end

    # action to create a profile for new users
    def create
      if current_user.profile.nil?
        profile = Profile.new(profile_params)
        profile.user = current_user
        if profile.save
          redirect_to profiles_path
          return
        end
      end
      redirect_to profiles_path
    end

    def edit

    end
    # action to edit a user's profile
    def update
      current_user.profile.update_attributes(profile_params)
      redirect_to '/profiles'
    end

    #button to link to the travel API
    def search
      @response = HTTParty.get("https://travelbriefing.org/#{params[:searchterm]}?format=json",
        :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})

      @response = JSON.parse(@response.parsed_response)
    end

    # Delete user's profile
    def destroy
      current_user.profile.delete
      flash[:message] = "Wizard successfully delete"
      redirect_to '/profiles'
    end

    # To parse the profile form tag
    def profile_params
      params.require(:profile).permit(:name, :countries_visited, :favourite_countries, :bucket_list, :travel_buddy)
    end
end

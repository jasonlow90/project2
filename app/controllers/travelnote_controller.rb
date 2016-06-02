class TravelnoteController < ApplicationController

  def index
    @response = HTTParty.get('https://travelbriefing.org/Thailand?format=json',
      :headers => { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})

    @response = JSON.parse(@response.parsed_response)


  end

end

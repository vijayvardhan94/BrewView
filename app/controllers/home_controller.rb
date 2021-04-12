class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json' 
    @url = 'https://api.openbrewerydb.org/breweries?by_city=Portland'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
    #checks for empty result from api
    if @output.empty?
        @final_output = "Error!"
    elsif !@output
      @final_output = "Error!"
    else 
        @final_output = @output[0]["name"]
    end
  end

  def lookup
    #@city = params[:city]
    require 'net/http'
    require 'json' 
    @url = 'https://api.openbrewerydb.org/breweries?by_city='
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @lookup_brewery = JSON.parse(@response)

    #@city = params[:city]
    
    

    if @city == ""
      @city = "Please enter the name of a city"
    end
  end
end

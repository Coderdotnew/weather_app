require './config/environment'
require './app/models/weather'
require 'json'
require 'wunderground'
require 'barometer'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

	get '/' do 
	  erb :index 
	end

	post '/weather' do
		@w_api = Wunderground.new("b4a427e287a66bb6")
		@city = params[:city]
		@state = params[:state]
		barometer = Barometer.new(@city)
		@weather = barometer.measure

		@city2 = params[:city2]
		@state2 = params[:state2]
		barometer2 = Barometer.new(@city2)
		@weather2 = barometer2.measure

		@city3 = params[:city3]
		@state3 = params[:state3]
		barometer3 = Barometer.new(@city3)
		@weather3 = barometer3.measure

		erb :weather
	end


end

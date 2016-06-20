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

		erb :weather
	end


end

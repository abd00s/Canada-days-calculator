require 'sinatra'
require_relative 'event.rb'

get "/" do 
	erb :index
end
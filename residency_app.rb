require 'sinatra'
require_relative 'event.rb'
require_relative 'calculator.rb'


get "/" do 
	erb :index
end
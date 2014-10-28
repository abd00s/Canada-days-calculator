require 'sinatra'
require_relative 'event.rb'
require_relative 'calculator.rb'

#$calculator = Calculator.new

get "/" do 
	erb :index
end

get "/add_event" do
	erb :add_event
end

get "/show_history" do
	erb :show_history
end

post "/show_history" do
	"Event added successfully"
end
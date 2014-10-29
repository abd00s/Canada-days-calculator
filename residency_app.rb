require 'sinatra'
require_relative 'event.rb'
require_relative 'calculator.rb'
require_relative 'log.rb'

$log = Log.new 

get "/" do 
	erb :index
end

get "/add_event" do
	erb :add_event
end

get "/show_history" do
	@events = $log.events
	erb :show_history
end


post "/add_event" do
	new_event = Event.new(params[:date_from], params[:date_to], params[:location], params[:description])
	$log.add_event(new_event)
	redirect to('/show_history')
end



get '/results' do
	@total_days_absent = $log.total_days_absent
	erb :results
	#do calculation
	# erb :results
end

post '/results' do
	#@total_days_absent = $log.total_days_absent
	erb :results 	
end
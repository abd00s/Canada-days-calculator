require 'sinatra'
require 'date'
require_relative 'event.rb'
require_relative 'selector.rb'
require_relative 'log.rb'

$log = Log.new 
$start_day = Date.parse('2013-01-27')

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
	# @apply_on = @total_days_absent + $start_day
	erb :results
	#do calculation
	# erb :results
end

post '/results' do
	#@total_days_absent = $log.total_days_absent
	erb :results 	
end
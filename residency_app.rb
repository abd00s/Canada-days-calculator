require 'sinatra'
require 'date'
require_relative 'event.rb'
require_relative 'selector.rb'
require_relative 'log.rb'

$log = Log.new 
$start_day = Date.parse('2013-01-27')

get "/" do 
	erb :index, :layout => :layout
end

# post "/" do
# 	$selector = Selector.new(params[:application_type])
# 	@days_required = selector.application_type
# 	redirect to('/results')
# end

get "/add_event" do
	erb :add_event, :layout => :layout
end

get "/show_history" do
	@events = $log.events
	erb :show_history, :layout => :layout
end


post "/add_event" do
	new_event = Event.new(params[:date_from], params[:date_to], params[:location], params[:description])
	$log.add_event(new_event)
	redirect to('/add_event')
end



get '/results' do
	@total_days_absent = $log.total_days_absent
	selector = Selector.new(params[:application_type])
 	@days_required = selector.application_type
	# @apply_on = @total_days_absent + $start_day
	erb :results, :layout => :layout
	#do calculation
	# erb :results
end

post '/results' do
	#@total_days_absent = $log.total_days_absent
	erb :results, :layout => :layout 	
end
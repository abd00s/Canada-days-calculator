require 'sinatra'
require 'date'
require 'data_mapper'

require_relative 'selector.rb'
require_relative 'log.rb'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Event		
	include DataMapper::Resource 
	property :id, Serial
	property :date_from, Date
	property :date_to, Date
	property :location, String
	property :description, String
	# @duration = Date.strptime(@date_to, '%Y-%m-%d') - Date.strptime(@date_from, '%Y-%m-%d')
end
	DataMapper.finalize
	DataMapper.auto_upgrade!


# $log = Log.new 		DataMapper
$start_day = Date.parse('2013-01-27')

get "/" do 
	erb :index, :layout => :layout
end

get "/add_event" do
	@events = Event.all 				#DataMapper
	erb :add_event, :layout => :layout
end

get "/show_history" do
	# @events = $log.events    #DataMapper
	@events = Event.all
	erb :show_history, :layout => :layout
end


# post "/add_event" do  											#DataMapper
# 	new_event = Event.new(params[:date_from], params[:date_to], params[:location], params[:description])
# 	$log.add_event(new_event)
# 	redirect to('/add_event')
# end

post "/add_event" do
	new_event = Event.create(
		:date_from   => params[:date_from],
		:date_to     => params[:date_to],
		:location    => params[:location],
		:description => params[:description]
		)
	redirect to ("/add_event")
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

get '/show_history/:id' do
	# @event = $log.event_details(params[:id].to_i)  #DataMapper
	@event = Event.get(params[:id].to_i)
	if @event 
		erb :show_event
	else
		raise Sinatra::NotFound
	end
end

put '/show_history/:id' do
	# @event = $log.event_details(params[:id].to_i)
	if @event 
		@event.date_from = params[:date_from]
		@event.date_to = params[:date_to]
		@event.location = params[:location]
		@event.description = params[:description]

		redirect to '/show_history'
	else
		raise Sinatra::NotFound
	end
end

get "/show_history/:id/edit" do
	# @event = $log.event_details(params[:id].to_i)
	@event = Event.get(params[:id].to_i)
	if @event
		erb :edit_event
	else
		raise Sinatra::NotFound
	end
end

delete "/show_history/:id" do
	@event = $log.event_details(params[:id].to_i)
	if @event 
		$log.delete_event(@event)
		redirect to ("/show_history")

	else
		raise Sinatra::NotFound
	end
end








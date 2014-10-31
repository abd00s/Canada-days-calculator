class Event		
	attr_accessor :id, :duration, :date_from, :date_to, :location, :description
	def initialize(date_from, date_to, location, description)
		@date_from = date_from
		@date_to = date_to
		@location = location
		@description = description
		@duration = Date.strptime(@date_to, '%Y-%m-%d') - Date.strptime(@date_from, '%Y-%m-%d')
	end
end
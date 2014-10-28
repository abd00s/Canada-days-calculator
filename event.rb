class Event		
	attr_reader :duration
	def initialize(date_from, date_to, location, description)
		@date_from = date_from
		@date_to = date_to
		@location = location
		@description = description
		@duration = @date_to - @date_from		
	end
end
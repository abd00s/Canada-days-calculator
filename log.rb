class Log
	def initialize
		@events = []
		@id = 1
	end

	def events
		@events
	end

	def add_event(event)
		event.id = @id
		@events << event
		@id += 1
	end

	def delete_event(event)
		@events.delete(event)
	end

	def event_details(id)
		@events.find {|event| event.id == id}
	end

	def total_days_absent
		@events.inject(0) {|sum, event| sum += event.duration}
	end
end
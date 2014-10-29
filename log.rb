class Log
	def initialize
		@events = []
	end

	def events
		@events
	end

	def add_event(event)
		@events << event
	end

	def total_days_absent
		@events.inject(0) {|sum, event| sum += event.duration}
	end
end
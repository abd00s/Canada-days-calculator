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
end
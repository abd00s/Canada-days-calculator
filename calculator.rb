require 'date'

class Calculator
	def initialize(applying_for)
		@applying_for = applying_for 
		@travels = []
		@total_days_absent = 0
		@start_date = Date.new(2013,1,27)
	end

	def calculate
		@travels.each {|event| @total_days_absent += event.duration}
		application_type
	end

	def application_type
		case applying_for
		when "Residency Renewal" then 730
		when "Apply for Citizenship" then 1095
		when "Apply for Citizenship (new law)" then 1460
		end
	end
end
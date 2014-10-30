class Selector
	def initialize(applying_for)
		@applying_for = applying_for 
		# @start_date = Date.new(2013,1,27)
	end

	def application_type
		case @applying_for
		when "Residency_Renewal" then 730
		when "Citizenship" then 1095
		when "Citizenship_new" then 1460
		end
	end
end
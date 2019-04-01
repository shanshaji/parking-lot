class PrintStatus
	def initialize slots
		@slots = slots
	end

	def print_status
		puts "Slot No.\t Registration No\t Colour"
    	@slots.each do | slot |
      		puts "#{ slot.id }\t\t #{ slot.vehicle_number }\t\t #{ slot.vehicle_color }" unless (slot.free?)
    	end
	end
end
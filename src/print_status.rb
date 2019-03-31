class PrintStatus
	def initialize slots
		puts "Slot No.\t Registration Number\t Colour"
    	slots.each do | slot |
      		puts "#{ slot.id }\t\t #{ slot.vehicle_number }\t\t #{ slot.vehicle_color }" unless (slot.free?)
    	end
	end
end
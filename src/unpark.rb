class Unpark
	attr_accessor :slots, :slot_number
	def initialize slots, slot_number
		@slots = slots
		@slot_number = slot_number.to_i
    	
	end

	def unpark
		if slot_number > 0 && slot_number <= slots.length
      		slots[slot_number - 1].free
      		puts "Slot number #{slot_number.to_i} is free"
    	else
      		puts "Invalid slot number"
    	end
	end
end
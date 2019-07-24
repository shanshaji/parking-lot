class FindCarByNumber

	def initialize slots
		@slots = slots
	end

	def find_slot vehicle_number
		slot = @slots.find do |slot|
	      slot.vehicle_number == vehicle_number
	    end
	    puts slot ? slot.id : 'Not found'
	end
end
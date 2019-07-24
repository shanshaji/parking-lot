class FindFreeSlot
	def find_parking_slot slots
    	slots.find do |slot|
      		slot.free?
    	end
	end
end
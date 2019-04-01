class Park	
	def park_my_vehicle vehicle_number, vehicle_color, slot
      	puts "Allocated slot number: #{ slot.id }"
      	slot.park(vehicle_number, vehicle_color)
    end
end
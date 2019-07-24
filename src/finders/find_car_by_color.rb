require_relative '../filters/filter_cars'
class FindCarByColor
	def find_registration_number color, slots
		filtered_cars = FilterCar.new(slots).filter_cars('vehicle_number', 'vehicle_color', color)
		print_data filtered_cars
	end

	def find_slot_number color, slots
		filtered_cars = FilterCar.new(slots).filter_cars('id', 'vehicle_color', color)
		print_data filtered_cars
	end

	private

	def print_data filtered_cars
		if filtered_cars.compact.empty?
			puts "No Car Found"
		else
    		puts filtered_cars.compact.join(', ')
    	end
	end
end
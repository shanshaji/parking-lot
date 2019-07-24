class FilterCar

	def initialize slots
		@slots = slots
	end

	def filter_cars(filtered_value, filter_by, filter)
      @slots.collect do |slot|
        slot.send(filtered_value) if slot.send(filter_by) == filter
      end
    end
end
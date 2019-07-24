
require_relative './entities/slots'
require_relative './actions/park'
require_relative './finders/find_free_slot'
require_relative './actions/unpark'
require_relative './actions/print_status'
require_relative './finders/find_car_by_color'
require_relative './finders/find_car_by_number'
class ParkingSpace

  attr_accessor :slots
  PARKING_FULL_MESSAGE = 'Sorry, parking lot is full'

  def initialize(number_of_slots)
    @slots = []
    number_of_slots.to_i.times do |index|
      slot_number = index + 1
      slots[index] = Slot.new(slot_number)
    end
    puts "Created a parking lot with #{ number_of_slots } slots"
  end

  def park(vehicle_number, vehicle_color)
    free_slot = FindFreeSlot.new.find_parking_slot slots
    if free_slot
      Park.new.park_my_vehicle(vehicle_number, vehicle_color, free_slot)
    else
      parking_lot_full_handler
    end
  end

  def leave(slot_number)
    Unpark.new(slots, slot_number).unpark
  end

  def status
    PrintStatus.new(slots).print_status
  end

  def registration_numbers_for_cars_with_colour (color)
    FindCarByColor.new.find_registration_number color, slots
  end

  def slot_numbers_for_cars_with_colour (color)
    FindCarByColor.new.find_slot_number color, slots
  end

  def slot_number_for_registration_number (vehicle_number)
    FindCarByNumber.new(slots).find_slot vehicle_number
  end


  private

  def parking_lot_full_handler
    puts ParkingSpace::PARKING_FULL_MESSAGE
  end

end

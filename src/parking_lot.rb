
require_relative './slots'
require_relative './park'
require_relative './find_free_slot'
require_relative './unpark'
require_relative './print_status'
class ParkingLot

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
    Unpark.new(slots, slot_number)
  end

  def status
    PrintStatus.new(slots)
  end

  private

  def parking_lot_full_handler
    puts ParkingLot::PARKING_FULL_MESSAGE
  end

end

p =ParkingLot.new(6)
p.park("KA-01-HH-1234", "White")
p.park("KA-02-HH-6534", "Black")
p.park("KA-02-HH-3434", "Red")
p.park("KA-02-HH-1434", "White")
p.leave(3)
p.status

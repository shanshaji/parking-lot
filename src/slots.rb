require_relative './vehicle'

class VehicleAlreadyParked < StandardError;end

class Slot
  attr_accessor :id, :vehicle

  def initialize (id)
    @id = id.to_i
  end

  def park(vehicle_number, vehicle_color)
    if self.vehicle
      raise VehicleAlreadyParked
    else
      self.vehicle = ::Vehicle.new(vehicle_number, vehicle_color)
    end
  end

  def free?
    self.vehicle == nil
  end
end
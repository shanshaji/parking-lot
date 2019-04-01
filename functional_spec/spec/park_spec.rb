require_relative '../../src/parking_space'
require_relative '../../src/slots'
RSpec.describe 'park' do
    context 'given input paramaters is correct & slots are free' do
      it 'allocates a slot to the vehicle' do
        parking_lot = ParkingSpace.new('1')
        parking_lot.park('car_no', 'car_color')
        expect(parking_lot.slots[0].vehicle_number).to eql('car_no')
        expect(parking_lot.slots[0].vehicle_color).to eql('car_color')
      end
    end

    context 'given input paramaters is correct & slots are not free' do
      it 'logs errors' do
        parking_lot = ParkingSpace.new('1')
        parking_lot.park('car_no', 'car_color')
        expect do
            parking_lot.park('car_no1', 'car_color1')
        end.to output("Sorry, parking lot is full\n").to_stdout
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        parking_lot = ParkingSpace.new('1')
        expect { parking_lot.park }.to raise_error(ArgumentError)
      end
    end
    context 'given vehicle paramaters are correct' do
      it 'sets vehicle as alloted new vehicle' do
        slot = Slot.new('1')
        slot.park('vehicle_number', 'vehicle_color')
        expect(slot.vehicle.class).to eql(Vehicle)
        expect(slot.vehicle.vehicle_number).to eql('vehicle_number')
        expect(slot.vehicle.vehicle_color).to eql('vehicle_color')
      end

      it 'throws error if a vehicle is parked where slot is filled' do
        slot = Slot.new('1')
        slot.park('vehicle_number', 'vehicle_color')
        expect { slot.park('vehicle_number1', 'vehicle_color1') }.to raise_error(VehicleAlreadyParked)
      end
  	end
end
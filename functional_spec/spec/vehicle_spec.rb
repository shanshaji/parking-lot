require_relative '../../src/vehicle'

RSpec.describe Vehicle do
  describe 'initialize' do
    context 'given input paramaters is correct' do
      it 'returns new vehicle instance' do
        vehicle = Vehicle.new('number', 'color')
        expect(vehicle.class).to eql(Vehicle)
        expect(vehicle.vehicle_number).to eql('number')
        expect(vehicle.vehicle_color).to eql('color')
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        expect { Vehicle.new }.to raise_error(ArgumentError)
        expect { Vehicle.new('number') }.to raise_error(ArgumentError)
        expect { Vehicle.new('color') }.to raise_error(ArgumentError)
      end
    end
  end
end
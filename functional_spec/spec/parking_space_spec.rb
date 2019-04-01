require_relative '../../src/parking_space'

RSpec.describe ParkingSpace do
    describe 'initialize' do
        context 'given input paramaters is correct' do
          it 'returns new parking lot instance' do
            parking_lot = ParkingSpace.new('1')
            expect(parking_lot.slots.length).to eql(1)
            expect(parking_lot.slots[0].id).to eql(1)
            parking_lot2 = ParkingSpace.new(2)
            expect(parking_lot2.slots.length).to eql(2)
          end
        end

        context 'given input paramaters have partial or no parameters' do
          it 'throws exception due to missing argument errors' do
            expect { ParkingSpace.new }.to raise_error(ArgumentError)
          end
        end

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

        context 'given input paramaters is correct and within slot range' do
          it 'free a slot for any vehicle' do
            parking_lot = ParkingSpace.new('1')
            parking_lot.park('car_no', 'car_color')
            parking_lot.leave(1)
            expect(parking_lot.slots[0].free?).to eql(true)
            parking_lot.leave(1)
            expect(parking_lot.slots[0].free?).to eql(true)
          end
        end

        context 'given input paramaters is correct but outside slots available' do
          it 'logs slot error' do
            parking_lot = ParkingSpace.new('1')
            parking_lot.park('car_no', 'car_color')
            expect do
                parking_lot.leave(10)
            end.to output("Invalid slot number\n").to_stdout
          end
        end

        context 'given input paramaters have partial or no parameters' do
          it 'throws exception due to missing argument errors' do
            parking_lot = ParkingSpace.new('1')
            expect { parking_lot.leave }.to raise_error(ArgumentError)
          end
        end

        context 'given input paramaters is correct & cars found' do
          it 'returns car numbers in comma seperated format' do
            parking_lot = ParkingSpace.new(5)
            parking_lot.park('car_no', 'car_color')
            parking_lot.park('car_no1', 'car_color1')
            parking_lot.park('car_no2', 'car_color')
            parking_lot.park('car_no3', 'car_color1')
            expect do
                parking_lot.registration_numbers_for_cars_with_colour('car_color')
            end.to output("car_no, car_no2\n").to_stdout
          end
        end

        context 'given input paramaters is correct & cars not found' do
          it 'returns empty string' do
            parking_lot = ParkingSpace.new(5)
            parking_lot.park('car_no', 'car_color')
            parking_lot.park('car_no1', 'car_color1')
            parking_lot.park('car_no2', 'car_color')
            parking_lot.park('car_no3', 'car_color1')
            expect do
                parking_lot.registration_numbers_for_cars_with_colour('car_color2')
            end.to output("No Car Found\n").to_stdout
          end
        end

        context 'given input paramaters have partial or no parameters' do
          it 'throws exception due to missing argument errors' do
            parking_lot = ParkingSpace.new('1')
            expect { parking_lot.registration_numbers_for_cars_with_colour }.to raise_error(ArgumentError)
          end
        end

        context 'given input paramaters is correct & slots found' do
          it 'returns car numbers in comma seperated format' do
            parking_lot = ParkingSpace.new(5)
            parking_lot.park('car_no', 'car_color')
            parking_lot.park('car_no1', 'car_color1')
            parking_lot.park('car_no2', 'car_color')
            parking_lot.park('car_no3', 'car_color1')
            expect do
                parking_lot.slot_numbers_for_cars_with_colour('car_color')
            end.to output("1, 3\n").to_stdout
          end
        end

        context 'given input paramaters is correct & slots not found' do
          it 'returns empty string' do
            parking_lot = ParkingSpace.new(5)
            parking_lot.park('car_no', 'car_color')
            parking_lot.park('car_no1', 'car_color1')
            parking_lot.park('car_no2', 'car_color')
            parking_lot.park('car_no3', 'car_color1')
            expect do
                parking_lot.slot_numbers_for_cars_with_colour('car_color2')
            end.to output("No Car Found\n").to_stdout
          end
        end

        context 'given input paramaters have partial or no parameters' do
          it 'throws exception due to missing argument errors' do
            parking_lot = ParkingSpace.new('1')
            expect { parking_lot.slot_numbers_for_cars_with_colour }.to raise_error(ArgumentError)
          end
        end
        context 'given input paramaters is correct & car found' do
          it 'returns car numbers in comma seperated format' do
            parking_lot = ParkingSpace.new(5)
            parking_lot.park('car_no', 'car_color')
            parking_lot.park('car_no1', 'car_color1')
            parking_lot.park('car_no2', 'car_color')
            parking_lot.park('car_no3', 'car_color1')
            expect do
                parking_lot.slot_number_for_registration_number('car_no')
            end.to output("1\n").to_stdout
          end
        end

        context 'given input paramaters is correct & car not found' do
          it 'returns empty string' do
            parking_lot = ParkingSpace.new(5)
            parking_lot.park('car_no', 'car_color')
            parking_lot.park('car_no1', 'car_color1')
            parking_lot.park('car_no2', 'car_color')
            parking_lot.park('car_no3', 'car_color1')
            expect do
                parking_lot.slot_number_for_registration_number('car_no5')
            end.to output("Not found\n").to_stdout
          end
        end

        context 'given input paramaters have partial or no parameters' do
          it 'throws exception due to missing argument errors' do
            parking_lot = ParkingSpace.new('1')
            expect { parking_lot.slot_number_for_registration_number }.to raise_error(ArgumentError)
          end
        end
    end
end
        
require_relative '../../src/slots'

RSpec.describe Slot do
  describe 'initialize' do
    context 'given input paramaters is correct' do
      it 'returns new slot instance' do
        slot = Slot.new('1')
        expect(slot.class).to eql(Slot)
        expect(slot.id).to eql(1)
        slot = Slot.new(2)
        expect(slot.id).to eql(2)
      end
    end

    context 'given input paramaters have partial or no parameters' do
      it 'throws exception due to missing argument errors' do
        expect { Slot.new }.to raise_error(ArgumentError)
      end
    end

    context 'make parking slot free' do
      it 'sets vehicle as nil' do
        slot = Slot.new('1')
        slot.free
        expect(slot.vehicle).to eql(nil)
      end
    end

    context 'is parking slot free' do
      it 'returns true' do
        slot = Slot.new('1')
        expect(slot.free?).to eql(true)
      end
    end

    context 'vehicle alloted' do
      it 'returns false' do
        slot = Slot.new('1')
        slot.park('xyz', 'White')
        expect(slot.free?).to eql(false)
      end
    end
    context 'finds the vehicle_number' do
      it 'gives nil if no vehicle alloted' do
        slot = Slot.new('1')
        expect(slot.vehicle_number).to eql(nil)
      end
      it 'gives vehicle number if vehicle alloted' do
        slot = Slot.new('1')
        slot.park('xyz', 'White')
        expect(slot.vehicle_number).to eql('xyz')
      end
    end
  end
end
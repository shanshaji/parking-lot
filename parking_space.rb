require_relative './src/parking_lot'
class ParkingSpace

    def get_input
	  if (ARGV.length == 0)
	    puts "Please enter file parameter"
	    return
	  else
	    begin
	      input = File.read(ARGV[0])
	    rescue StandardError => file
	      puts "Error reading file #{ file }"
	      return
	    end
	  end
	  begin
	    process_commands(input)
	  rescue StandardError => file
	  puts "Error processing input. Error - #{ file }"
	  end
	end

	def process_commands(input)
	  latest_parking_lot = nil
	  input.split("\n").each do |input|
	    sliced_input = input.split(/\s/)
	    command = sliced_input[0]
	    if  command == 'create_parking_lot'
	      no_of_slots = sliced_input[1]
	      latest_parking_lot = ParkingLot.new(no_of_slots)
	    else
	      latest_parking_lot.send(command, *([sliced_input[1], sliced_input[2]].compact))
	    end
	  end
	end
	ParkingSpace.new.get_input
end
#!/usr/bin/env ruby

class VdfToYAML

	# Holds the indentation level
	@@indentation_count = 0

	# Takes a stream in (string) and puts out YAML to a file
	def parseToFile(input_stream, output_file)
	
		# Stats for coolness
		t0 = Time.now
	
		# STL scanner for the input stream
		scanner = StringScanner.new(input_stream); 0
		
		# output file as specified in parameters
		yaml_file = File.open(output_file, 'w'); 0
		
		while scanner.eos? == false
		
			#search for a top level element
			current_segment = scanner.scan(/\"[a-zA-Z0-9'_ .\-\/#\\,:!]*\"[ \n\t]*{/)
			if current_segment != nil
				current_segment = current_segment.tr("}{\n\r\t\"", "")
				yaml_file.write(" "*@@indentation_count + current_segment + ":\n")
				@@indentation_count = @@indentation_count + 1
			end
			
			# Search for a Key-Value pair
			current_segment = scanner.scan(/[\s]*\"[a-zA-Z0-9'_ .\-\/#\\,:!]+\"[\s]*\"[a-zA-Z0-9'_ .\-\/#\\,:!]+\"/)
			if current_segment != nil
				current_segment = current_segment.rstrip.lstrip
				key = current_segment.split(/\"/)
				key = sanitizeInput(key)
				yaml_file.write(" "*@@indentation_count + key[0] + ":\t" + key[2] + "\n")
			end
			
			# Search for an end segment
			current_segment = scanner.scan(/[\s]}/)
			if current_segment != nil
				@@indentation_count = @@indentation_count -1
				if @@indentation_count <= 0
					puts "Reached Root Indentation"
				end
			end
			
			current_segment = scanner.scan_until(/[\s]/)
			
		end
		
		puts "Conversion Complete, Time Taken: #{Time.now - t0} Seconds"
	
	end
	
	#deals with inconsistencies from VDF to YAM, issues like characters in the key segment, looks like [:key, "junk", :value]
	def sanitizeInput(key)
		key = key.compact
		key = key.reject{|element| element.empty?}

		key[0] = key[0].tr('"', "")
		key[2] = key[2].tr('"', "")
		
		if key[0].include? ":"
			key[0] = '"' + key[0] + '"'
		elsif key[0].include? "#"
			key[0] = '"' + key[0] + '"'
		end
		
		if key[2].include? ":"
			key[2] = '"' + key[2] + '"'
		end
		if key[2][0] == "'"
			key[2] = '"' + key[2] + '"'
		end
		
		return key
	end

end
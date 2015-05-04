#!/usr/bin/env ruby
require 'json'
require_relative 'vdf-converter/vdf-to-yaml.rb'

class VdfConverter
	
	def saveYAML(source, output_file)
		parser = VdfToYAML.new
		parser.parseToFile(source, output_file)
		puts "Done"
	end
	
	#TODO
	def saveXML(source, output_file)
		puts "Not Implemented Yet."
	end
	
	def saveJSON(source, output_file)
		puts "Generating to YAML first..."
		parser = VdfToYAML.new
		parser.parseToFile(source, "__tmp-vdf-converter.yml")
		settings = YAML::load_file "__tmp-vdf-converter.yml"
		puts "Writing YAML to JSON..."
		json = JSON.pretty_generate settings
		File.open(output_file, 'w') { |file| file.write(json) }
		puts "Done"
	end
end
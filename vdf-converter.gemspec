Gem::Specification.new do |s|
  s.name        = 'vdf-converter'
  s.version     = '0.0.3'
  s.date        = '2015-05-04'
  s.summary     = "Gem that will convert Valve's data format to alternative formats!"
  s.description = "Takes a file or stream in the VDF format developed by valve and converts it to alternative formats including YAML, JSON and a native hash."
  s.authors     = ["Joshua Richardson"]
  s.email       = 'joshua@fridayplans.com'
  s.files       = ["lib/vdf-converter.rb", "lib/vdf-converter/vdf-to-yaml.rb"]
  s.homepage    = 'https://github.com/JoshuaRichardson93/vdf-converter'
  s.license       = 'MIT'
end
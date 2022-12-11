Gem::Specification.new do |s|
	s.name = 'connect_four_2211'
	s.version = '0.1.0'
	s.platform = Gem::Platform::RUBY
	s.summary = 'Connect Four - Pair Project'
	s.authors = ['Axel De La Guardia', 'Jasmine Hamou']
	s.files = Dir['lib/**/*.rb']

	s.add_development_dependency 'rspec', '~> 3.7'
	s.executables = ['connect_four_2211']
end
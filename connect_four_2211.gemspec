Gem::Specification.new do |s|
	s.name = 'connect_four_2211'
	s.version = '0.2.0'
	s.platform = Gem::Platform::RUBY
	s.summary = 'Connect Four - Pair Project'
	s.authors = ['Axel De La Guardia', 'Jasmine Hamou']
	s.files = Dir.glob("{lib, bin}/**/*")

	s.add_development_dependency 'rspec', '~> 3.7'
	s.executables = ['connect_four_2211']
	s.require_path = 'lib'
end
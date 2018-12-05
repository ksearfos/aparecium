require 'rspec'
require 'aparecium'
require 'pathname'

SPEC = Pathname.new(__FILE__).parent
Dir[SPEC.join('support/**/*.rb')].each { |file| require file }

RSpec.configure do |c|
	c.color = true
	c.fail_fast = true
	c.formatter = :documentation
end

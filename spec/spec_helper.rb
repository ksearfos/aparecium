require 'rspec'
require 'aparecium'

RSpec.configure do |c|
	c.color = true
	c.fail_fast = true
	c.formatter = :documentation
end

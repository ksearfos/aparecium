require 'pathname'

module FixtureHelper
  FIXTURES = Pathname.new(__FILE__).parent.join('fixtures')
  NONRECURSIVE_FIXTURE = FIXTURES.join('app3_cmmdata.yml')
  EMPTY_DEPS_FIXTURE = FIXTURES.join('app5_cmmdata.yml')
  FIXTURE_WITH_OTHER_STUFF = FIXTURES.join('app4_cmmdata.yml')
  EMPTY_FIXTURE = FIXTURES.join('empty_cmmdata.yml')

  # class << self
  #   def nonrecursive_data
  #     load_fixture(NONRECURSIVE_FIXTURE)
  #   end
  #
  #   def empty_data
  #     load_fixture(EMPTY_DEPS_FIXTURE)
  #   end
  #
  #   def full_data
  #     load_fixture(FIXTURE_WITH_OTHER_STUFF)
  #   end
  #
  #   def data
  #     load_fixture('app1')
  #   end
  #
  #   def load_fixture(app)
  #     FIXTURES.join("#{app}_#{FIXTURE_FILENAME}").read
  #   end
  # end
end

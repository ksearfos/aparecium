require 'pathname'

module FixtureHelper
  FIXTURES = Pathname.new(__DIR__).join('fixtures')
  FIXTURE_FILENAME = "cmmdata.yml"
  NONRECURSIVE_FIXTURE = 'app3'
  EMPTY_DEPS_FIXTURE = 'app5'
  FIXTURE_WITH_OTHER_STUFF = 'app4'

  class << self
    def nonrecursive_data
      load_fixture(NONRECURSIVE_FIXTURE)
    end

    def empty_data
      load_fixture(EMPTY_DEPS_FIXTURE)
    end

    def full_data
      load_fixture(FIXTURE_WITH_OTHER_STUFF)
    end

    def data
      load_fixture('app1')
    end

    def load_fixture(app)
      FIXTURES.join("#{app}_#{FIXTURE_FILENAME}").read
    end
  end
end

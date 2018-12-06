require 'pathname'

module FixtureHelper
  # fixtures
  FIXTURES_DIR = Pathname.new(__FILE__).parent.join('fixtures')
  NONRECURSIVE_FIXTURE = FIXTURES_DIR.join('app3_cmmdata.yml')
  DEPS_WITH_DEPS_FIXTURE = FIXTURES_DIR.join('deps_with_deps_cmmdata.yml')
  EMPTY_DEPS_FIXTURE = FIXTURES_DIR.join('app5_cmmdata.yml')
  FIXTURE_WITH_OTHER_STUFF = FIXTURES_DIR.join('app4_cmmdata.yml')
  EMPTY_FIXTURE = FIXTURES_DIR.join('empty_cmmdata.yml')
  FIXTURE_WITH_ALL_DEPS = FIXTURES_DIR.join('app1_cmmdata.yml')

  # hard-coded dependencies
  NONRECURSIVE_DEPS = %w(app5)
  DEPS_WITH_OTHER_STUFF = %w(app5 app6)
  DEPS_WITH_DEPS = %w(app3 app5)
  ALL_DEPS = %w(app2 app3 app4 app5 app6 app7)
end

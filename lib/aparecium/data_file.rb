require 'yaml'

class Aparecium
  class DataFile
    DEPENDENCIES_KEY = 'dependencies'.freeze

    def initialize(file)
      @contents = YAML.load(file.read) || {}
    end

    # list of hashes' keys
    def dependencies
      dependencies_with_paths.keys
    end

    # array of hashes
    def dependencies_with_paths
      @contents.fetch(DEPENDENCIES_KEY, {})
    end
  end
end

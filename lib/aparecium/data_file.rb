require 'yaml'

module Aparecium
  class DataFile
    DEPENDENCIES_KEY = 'dependencies'.freeze

    attr_reader :dependencies

    def initialize(file)
      @contents = YAML.load(file.read)
      @dependencies = (@contents && @contents[DEPENDENCIES_KEY]).to_a
    end
  end
end

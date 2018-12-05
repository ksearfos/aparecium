require 'yaml'

module Aparecium
  class DependencyFinder
    attr_reader :dependencies

    def initialize(file_contents)
      @contents = file_contents
      @dependencies = @contents['dependencies'] || []
    end
  end
end

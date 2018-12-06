require 'aparecium/data_file'

class Aparecium
  ROOT = Pathname.new(__FILE__).parent.parent

  attr_reader :dependencies

  def initialize(file)
    @file = DataFile.new(file)
  end

  def all_dependencies()
    recursive_dependencies(@file, []).uniq
  end

  private

  def data_file(partial_path)
    DataFile.new(full_path(partial_path))
  end

  def full_path(file)
    ROOT.join('spec', 'support', 'fixtures', file)
  end

  def recursive_dependencies(file, known_dependencies)
    immediate_deps = file.dependencies_with_paths

    immediate_deps.each do |name, filepath|
      next if known_dependencies.include?(name)  # no infinite recursion!
  
      known_dependencies << name
      known_dependencies += recursive_dependencies(data_file(filepath), known_dependencies)
    end

    known_dependencies
  end
end

require 'aparecium/data_file'

class Aparecium
  ROOT = Pathname.new(__FILE__).parent.parent

  def initialize
    @counter = 0
    @dependencies = []
  end

  def all_dependencies(file)
    file = DataFile.new(file)
    immediate_deps = file.dependencies_with_paths

    # get list of all immediate dependencies
    # for each of those, add all of its immediate dependencies
    # keep going until we run out of dependencies
    # and don't add the same dependency twice
    immediate_deps.each do |name, file|
      @counter += 1
      next if @dependencies.include?(name) || @counter > 10
      @dependencies << name
      @dependencies += all_dependencies(full_path(file))
    end

    @dependencies.uniq
  end

  private

  def full_path(file)
    ROOT.join('spec', 'support', 'fixtures', file)
  end
end

require 'aparecium/data_file'

module Aparecium
  ROOT = Pathname.new(__FILE__).parent.parent

  def self.all_dependencies_for(file)
    recursive_dependencies_with_paths(file).keys
  end

  def self.full_path(file)
    ROOT.join('spec', 'support', 'fixtures', file)
  end

  def self.recursive_dependencies_with_paths(file)
    file = Aparecium::DataFile.new(file)
    immediate_deps = file.dependencies_with_paths
    all = immediate_deps.reduce({}) do |all_deps, dep_with_path|
      dep, path = *dep_with_path
      dep_file = full_path(path)

      if all_deps.has_key?(dep)
        all_deps
      else
        all_deps[dep] = dep_file
        all_deps.merge(recursive_dependencies_with_paths(dep_file))
      end
    end
  end
end

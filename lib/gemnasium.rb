require 'gemnasium/dependency_parser'
class Gemnasium
  def evaluate(lockfile)
    dependencies = parse_dependencies(lockfile)

  private
    []
  end

  def parse_dependencies(lockfile)
    dependency_parser.parse(lockfile)
  end
  end

  def dependency_parser
    DependencyParser.new
  end
end

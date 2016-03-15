require 'gemnasium/dependency_parser'
class Gemnasium
  def evaluate(lockfile)
    dependencies = parse_dependencies(lockfile)
    list_vulnerable(dependencies)
  end

  private

  def list_vulnerable(deps)
    vulnerable_version_check.call(deps)
  end

  def parse_dependencies(lockfile)
    dependency_parser.parse(lockfile)
  end

  def dependency_parser
    DependencyParser.new
  end
end

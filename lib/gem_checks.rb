require 'gem_checks/dependency_parser'
require 'gem_checks/vulnerable_version_check'

class GemnasiumValidator
  def initialize(dependency_parser=DependencyParser.new,
                 vulnerable_version_check=VulnerableVersionCheck.new)
    @dependency_parser = dependency_parser
    @vulnerable_version_check = vulnerable_version_check
  end

  def evaluate(lockfile)
    dependencies = parse_dependencies(lockfile)
    list_vulnerable(dependencies)
  end

  private

  def list_vulnerable(deps)
    @vulnerable_version_check.call(deps)
  end

  def parse_dependencies(lockfile)
    @dependency_parser.parse(lockfile)
  end
end

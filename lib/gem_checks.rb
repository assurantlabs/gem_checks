require 'gem_checks/dependency_parser'
require 'gem_checks/vulnerable_version_check'
require 'gem_checks/gem_collection'

class GemChecks
  def initialize(dependency_parser: DependencyParser.new,
                 vulnerable_version_check: VulnerableVersionCheck.new,
                 lockfile:)
    @dependency_parser = dependency_parser
    @vulnerable_version_check = vulnerable_version_check
    @lockfile = lockfile
  end

  def display_vulnerable_gems
    GemCollection.wrap(evaluate).display_vulnerable
  end

  private

  def evaluate
    dependencies = parse_dependencies
    list_vulnerable(dependencies)
  end

  def parse_dependencies
    @dependency_parser.parse(@lockfile)
  end

  def list_vulnerable(deps)
    @vulnerable_version_check.call(deps)
  end

end

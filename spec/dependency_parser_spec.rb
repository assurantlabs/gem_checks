require 'spec_helper'
require 'gem_checks/dependency_parser'

RSpec.describe DependencyParser do
  describe '#parse' do
    it 'parses the file into a list' do
      lockfile = open_safe_file
      expect(subject.parse(lockfile)).to eq(safe_parsed_results)
    end
  end
end

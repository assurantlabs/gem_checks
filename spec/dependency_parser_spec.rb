require 'spec_helper'
require 'gem_checks/dependency_parser'

RSpec.describe DependencyParser do
  describe '#parse' do
    let(:lockfile) { open_safe_file }

    it 'parses the file into a list' do
      expect(subject.parse(lockfile)).to eq(safe_parsed_results)
    end
  end
end

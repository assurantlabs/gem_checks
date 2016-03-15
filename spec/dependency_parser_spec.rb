require 'spec_helper'
require 'gemnasium/dependency_parser'

RSpec.describe DependencyParser do
  describe '#parse' do
    let(:lockfile) { open_safe_file }

    it 'parses the file into a list' do
      expect(subject.parse(lockfile)).to eq(parsed_results)
    end
  end

  private

  def parsed_results
    [
      { gem_name: 'minitest', version: '5.8.4' },
      { gem_name: 'rake', version: '11.1.1' }
    ]
  end
end

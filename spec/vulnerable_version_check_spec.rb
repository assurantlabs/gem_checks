require 'spec_helper'
require 'gem_checks/vulnerable_version_check'

RSpec.describe VulnerableVersionCheck do
  class MockGemnasiumClient
    def vulnerable?(gem)
      gem == vulnerable_gem
    end
  end

  describe '#call' do
    context 'when there are no vulnerable gems' do
      it 'returns an empty collection' do
        subject = VulnerableVersionCheck.new(gemnasium_client: MockGemnasiumClient.new)
        expect(subject.call(safe_parsed_results)).to be_empty
      end
    end

    context 'when there are vulnerable gems' do
      it 'returns a collection of vulnerable gems' do
        subject = VulnerableVersionCheck.new(gemnasium_client: MockGemnasiumClient.new)
        expect(subject.call(vulnerable_parsed_results)).to include(vulnerable_gem)
      end
    end
  end
end

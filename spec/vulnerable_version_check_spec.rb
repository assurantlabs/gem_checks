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
      let(:deps) { safe_parsed_results }

      it 'returns an empty collection' do
        expect(VulnerableVersionCheck.new(gemnasium_client: MockGemnasiumClient.new)
                                     .call(deps)).to be_empty
      end
    end

    context 'when there are vulnerable gems' do
      let(:deps) { vulnerable_parsed_results }

      it 'returns a collection of vulnerable gems' do
        expect(VulnerableVersionCheck.new(gemnasium_client: MockGemnasiumClient.new)
                                     .call(deps)).to include(vulnerable_gem)
      end
    end
  end
end

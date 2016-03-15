require 'spec_helper'
require 'gem_checks/gemnasium_client'

RSpec.describe GemnasiumClient do
  describe '#vulnerable?', speed: 'slow' do
    context 'when the gem is not vulnerable' do
      let(:gem) { safe_parsed_results.first }

      it 'returns false' do
        gem = safe_parsed_results.last
        expect(subject.vulnerable?(gem)).to be_falsey
      end
    end

    context 'when the gem is vulnerable' do
      let(:gem) { vulnerable_parsed_results.last }

      it 'returns true' do
        expect(subject.vulnerable?(gem)).to be_truthy
      end
    end
  end
end

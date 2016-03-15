require 'spec_helper'
require 'gemnasium/vulnerable_version_check'

RSpec.describe VulnerableVersionCheck do
  describe '#call' do
    context 'when there are no vulnerable gems' do
      let(:deps) { safe_parsed_results }
      before do
        allow_any_instance_of(GemnasiumClient).to receive(:vulnerable?)
          .and_return(false)
      end

      it 'returns an empty list' do
        expect(subject.call(deps)).to be_empty
      end
    end

    context 'when there are vulnerable gems' do
      let(:deps) { vulnerable_parsed_results }
      before do
        allow_any_instance_of(GemnasiumClient).to receive(:vulnerable?) do |obj, arg|
          arg == vulnerable_gem ? true : false
        end
      end

      it 'returns a list of vulnerable gems' do
        expect(subject.call(deps)).to eq([vulnerable_gem])
      end
    end
  end

  private

  def vulnerable_gem
    { gem_name: 'rest-client', version: '1.6.0' }
  end
end

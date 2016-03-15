require 'spec_helper'
require 'gemnasium'

RSpec.describe Gemnasium do
  describe '#evaluate' do
    context 'with no vulnerabilities in the lockfile' do
      let(:lockfile) { open_safe_file }

      it 'returns an empty list' do
        expect(subject.evaluate(lockfile)).to eq([])
      end
    end

    context 'with one vulnerability in the lockfile' do
      let(:lockfile) { open_unsafe_one_vuln_file }

      it 'returns a list with that vulnerability' do
        expect(subject.evaluate(lockfile)).not_to be_empty
      end
    end
  end
end

require 'spec_helper'
require 'gem_checks'

RSpec.describe GemnasiumValidator do
  describe '#evaluate' do
    context 'with no vulnerabilities in the lockfile' do
      let(:lockfile) { open_safe_file }
      before do
        expect_any_instance_of(VulnerableVersionCheck).to receive(:call)
          .and_return([])
      end

      it 'returns an empty list' do
        expect(subject.evaluate(lockfile)).to eq([])
      end
    end

    context 'with one vulnerability in the lockfile' do
      let(:lockfile) { open_unsafe_one_vuln_file }
      before do
        expect_any_instance_of(VulnerableVersionCheck).to receive(:call)
          .and_return([vulnerable_parsed_results.last])
      end

      it 'returns a list with that vulnerability' do
        expect(subject.evaluate(lockfile)).not_to be_empty
      end
    end
  end
end

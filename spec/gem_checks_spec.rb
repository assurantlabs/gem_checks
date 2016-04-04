require 'spec_helper'
require 'gem_checks'

RSpec.describe GemChecks do
  class MockVulnerableVersionCheck
    def call(deps)
      return [] unless deps.include?(vulnerable_gem)
      [vulnerable_gem]
    end
  end

  describe '#display_vulnerable_gems' do
    context 'with no vulnerabilities in the lockfile' do

      it 'displays the empty collection message' do
        lockfile = open_safe_file
         subject = GemChecks.new(vulnerable_version_check: MockVulnerableVersionCheck.new,
                                 lockfile: lockfile)
        expect{ subject.display_vulnerable_gems }.to output(empty_collection_message).to_stdout
      end
    end

    context 'with one vulnerability in the lockfile' do

      it 'displays the vulnerable gem' do
        lockfile = open_unsafe_one_vuln_file
         subject = GemChecks.new(vulnerable_version_check: MockVulnerableVersionCheck.new,
                                 lockfile: lockfile)
        expect{ subject.display_vulnerable_gems }.to output(format_gem_message(vulnerable_gem)).to_stdout
      end
    end
  end
end

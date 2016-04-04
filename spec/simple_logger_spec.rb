require 'spec_helper'
require 'gem_checks/simple_logger'

RSpec.describe SimpleLogger do
  describe '#info' do
    context 'when the log level is set to info' do
      it 'prints a "."' do
        logger = SimpleLogger.new
        expect { logger.info }.to output('.').to_stdout
      end
    end

    context 'when the log level is set to warn' do
      it 'does not output anything' do
        logger = SimpleLogger.new(default_level: :warn)
        expect { logger.info }.not_to output('.').to_stdout
      end
    end
  end
end

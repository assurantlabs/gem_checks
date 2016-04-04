require 'spec_helper'
require 'gem_checks/gem_collection'

RSpec.describe GemCollection do
  describe '.wrap' do
    it 'delegates to the underlying collection' do
      expect(GemCollection.wrap([])).to be_empty
    end
  end

  describe '#display_vulnerable' do
    context 'when the collection is empty' do
      it 'displays a message that no gems are vulnerable' do
        assert_wrapped_collection_message(collection: [],
                                          message: empty_collection_message)
      end
    end

    context 'when the collection is not empty' do
      it 'displays the vulnerable gems' do
        assert_wrapped_collection_message(collection: [vulnerable_gem],
                                          message: format_gem_message(vulnerable_gem))
      end
    end
  end

  private

  def assert_wrapped_collection_message(collection:, message:)
    collection = GemCollection.wrap(collection)
    expect{ collection.display_vulnerable }.to output(message).to_stdout
  end
end

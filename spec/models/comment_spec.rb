require 'rails_helper'

RSpec.describe Comment do
  describe 'associations' do
    def association
      described_class.reflect_on_association(:article)
    end

    it 'belongs to an article' do
      expect(association).to_not be_nil
      expect(association.options[:inverse_of]).to_not be_nil
    end
  end
end

require 'rails_helper'

RSpec.describe Article do
  describe 'associations' do
    def association
      described_class.reflect_on_association(:comments)
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Expenditure', type: :model do
  subject { Expenditure.new(name: 'Rent', amount_pennies: 500, statement_id: statement.id) }

  let(:statement) { create(:statement) }

  describe 'associations' do
    it 'belongs to a statement' do
      expect(subject).to belong_to(:statement)
    end
  end
end

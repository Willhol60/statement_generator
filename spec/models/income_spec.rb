# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Income', type: :model do
  subject { Income.new(name: 'Salary', amount_pennies: 2000, statement_id: statement.id) }

  let(:statement) { create(:statement) }

  describe 'associations' do
    it 'belongs to a statement' do
      expect(subject).to belong_to(:statement)
    end
  end
end

# frozen_string_literal: true

RSpec.describe 'User', type: :model do
  let(:user) { create(:user) }

  describe 'associations' do
    it 'has many statements' do
      expect(user).to have_many(:statements)
    end

    it 'has many incomes' do
      expect(user).to have_many(:incomes)
    end

    it 'has many expenditures' do
      expect(user).to have_many(:expenditures)
    end
  end
end

# frozen_string_literal: true

RSpec.describe 'Statement', type: :model do # rubocop:disable Metrics/BlockLength
  let(:statement) { create(:statement) }

  let(:income1) { Income.create(name: 'Salary', amount_pennies: 2000, statement_id: statement.id) }
  let(:income2) { Income.create(name: 'Bonus', amount_pennies: 500, statement_id: statement.id) }
  let(:expenditure1) { Expenditure.create(name: 'Rent', amount_pennies: 500, statement_id: statement.id) }
  let(:expenditure2) { Expenditure.create(name: 'Groceries', amount_pennies: 200, statement_id: statement.id) }

  describe 'associations' do
    it 'belongs to a user' do
      expect(statement).to belong_to(:user)
    end

    it 'has many incomes' do
      expect(statement).to have_many(:incomes)
    end

    it 'has many expenditures' do
      expect(statement).to have_many(:expenditures)
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(statement).to be_valid
    end

    it 'is invalid without a name' do
      statement.name = nil
      expect(statement).to_not be_valid
    end

    it 'is invalid without a user_id' do
      statement.user_id = nil
      expect(statement).to_not be_valid
    end
  end

  before do
    income1
    income2
    expenditure1
    expenditure2
  end

  describe 'total_income' do
    it 'returns the total income for a statement' do
      expect(statement.total_income).to eq(2500)
    end
  end

  describe 'total_expenditure' do
    it 'returns the total expenditure for a statement' do
      expect(statement.total_expenditure).to eq(700)
    end
  end

  describe 'disposable_income' do
    it 'returns the disposable income for a statement' do
      expect(statement.disposable_income).to eq(1800)
    end
  end

  describe 'rating' do
    it 'returns the rating for a statement' do
      expect(statement.rating).to eq(0.28)
    end
  end

  describe 'grade' do
    it 'returns the grade for a statement' do
      expect(statement.grade).to eq('B')
    end
  end
end

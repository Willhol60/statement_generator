# frozen_string_literal: true

class Statement < ApplicationRecord
  include ::StatementConcern

  belongs_to :user
  has_many :incomes, dependent: :destroy
  has_many :expenditures, dependent: :destroy

  validates :name, presence: true
  validates :user_id, presence: true

  def incomes_attributes=(attributes)
    attributes.each_value do |income_attributes|
      next unless income_attributes[:name].present? && income_attributes[:amount_pennies].present?

      income_attributes[:amount_pennies] = income_attributes[:amount_pennies].to_i * 100
      incomes.build(income_attributes)
    end
  end

  def expenditures_attributes=(attributes)
    attributes.each_value do |expenditure_attributes|
      next unless expenditure_attributes[:name].present? && expenditure_attributes[:amount_pennies].present?

      expenditure_attributes[:amount_pennies] = expenditure_attributes[:amount_pennies].to_i * 100
      expenditures.build(expenditure_attributes)
    end
  end
end

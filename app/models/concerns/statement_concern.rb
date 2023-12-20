# frozen_string_literal: true

module StatementConcern
  extend ActiveSupport::Concern

  def total_income
    incomes.sum(:amount_pennies)
  end

  def total_expenditure
    expenditures.sum(:amount_pennies)
  end

  def disposable_income
    (total_income - total_expenditure)
  end

  def rating
    total_income.positive? ? (total_expenditure / total_income.to_f).round(2) : 0
  end

  def grade
    case rating
    when 0..0.1
      'A'
    when 0.1..0.3
      'B'
    when 0.3..0.5
      'C'
    else
      'D'
    end
  end
end

# frozen_string_literal: true

class Expenditure < ApplicationRecord
  belongs_to :statement
end

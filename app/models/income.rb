# frozen_string_literal: true

class Income < ApplicationRecord
  belongs_to :statement
end

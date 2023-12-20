# frozen_string_literal: true

FactoryBot.define do
  factory :statement do
    association :user
    name { 'test-statement' }
  end
end

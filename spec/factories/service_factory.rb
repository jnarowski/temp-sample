# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    sequence(:name, 10) { |n| "service #{n}" }
  end
end

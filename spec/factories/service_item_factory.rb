# frozen_string_literal: true

FactoryBot.define do
  factory :service_item do
    sequence(:name, 10) { |n| "service item #{n}" }
  end
end

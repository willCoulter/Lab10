FactoryBot.define do
  factory :comment, class: Comment do
    sequence(:message) { |n| "Message_#{n}" }
    user
    article
  end
end
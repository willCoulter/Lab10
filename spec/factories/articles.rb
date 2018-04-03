FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "title_#{n}" }
    content "This is my content"
    user
  end
end

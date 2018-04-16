# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :text
#  content    :text
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  uuid       :string
#  slug       :string
#

FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "title_#{n}" }
    content "This is my content"
    user
  end
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  message    :text
#  visible    :boolean          default(FALSE)
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  uuid       :string
#  slug       :string
#

FactoryBot.define do
  factory :comment, class: Comment do
    sequence(:message) { |n| "Message_#{n}" }
    user
    article
  end
end

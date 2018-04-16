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

class Comment < ApplicationRecord
  # Adds in the friendlyId into the model
  extend FriendlyId
  # Sets the default find finder to slugged but defaults if not found to default finders like ID
  friendly_id :uuid, use: [:slugged, :finders]


  belongs_to :article
  belongs_to :user

  validates :message, presence: true
end

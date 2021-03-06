# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  uuid                   :string
#  slug                   :string
#  roles                  :string           default("Non-Admin")
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :admin, class: User do
    sequence(:email) { |n| Faker::Internet.safe_email("admin_user_#{n}") }
    password "test1234"
    roles 'Admin'
  end
  factory :user, class: User do
    sequence(:email) { |n| Faker::Internet.safe_email("user_#{n}") }
    password "test1234"
  end
end

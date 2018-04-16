class AddSlugToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :uuid, :string, unique: true, index: true
    add_column :users, :slug, :string, unique: true, index: true

    User.all.each do |user|
      uuid = SecureRandom.uuid
      user.update_column(:uuid, uuid)
      user.update_column(:slug, uuid)
    end
  end
end

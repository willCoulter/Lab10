class AddRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :roles, :string, default: "Non-Admin"

    User.all.each do |user|
      user.update_column(:roles, "Non-Admin")
    end
  end
end

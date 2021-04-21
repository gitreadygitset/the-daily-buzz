class AddColumnsToUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string, null: false, default: "member"
    add_column :users, :username, :string, null: false

    add_index :users, :username, unique: true
  end
end

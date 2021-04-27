class AddUsersToCoffeeShops < ActiveRecord::Migration[5.2]
  def change
    change_table :coffee_shops do |t|
      t.belongs_to :user, null: false
    end
  end
end

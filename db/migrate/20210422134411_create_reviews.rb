class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.string :comment
      t.belongs_to :coffee_shop, null: false

      t.timestamps null: false
    end
  end
end

class AddProfilePhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_photo, :string, default: "https://cdn.pixabay.com/photo/2015/05/31/10/54/coffee-791045_960_720.jpg"
  end
end

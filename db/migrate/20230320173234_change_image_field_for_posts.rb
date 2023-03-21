class ChangeImageFieldForPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :image
    add_column :posts, :image_data, :text, null: false
  end
end

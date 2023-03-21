class AddCreatedByColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :created_by, :integer
  end
end

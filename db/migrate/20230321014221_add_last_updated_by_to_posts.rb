class AddLastUpdatedByToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :last_updated_by, :integer
  end
end

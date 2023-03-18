class AddInitialModels < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, unique: true, foreign_key: true
      t.string :password_digest, null: false
      t.string :name, null: false
      t.string :role, null: true

      t.timestamps
    end

    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :image, null: true
      t.boolean :is_hidden, null: false, default: false

      t.timestamps
    end

    create_table :comments do |t|
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class AddInitialModels < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.change :email, :string, unique: true, foreign_key: true
      t.change :password_digest, :string, null: false
      t.string :name, null: false
      t.string :role, null: true

      t.timestamps
    end

    create_table :news do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :image, null: true
      t.is_hidden :boolean, null: false, default: false

      t.timestamps
    end

    create_table :comments do |t|
      t.text :body, null: false
      t.references :users, null: false, foreign_key: true
      t.references :news, null: false, foreign_key: true

      t.timestamps
    end
  end
end

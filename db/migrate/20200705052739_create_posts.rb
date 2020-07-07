class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :sender,   foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users }
      t.text     :post,       null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps
    end
  end
end

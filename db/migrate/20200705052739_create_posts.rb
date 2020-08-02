class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :sender,     foreign_key: { to_table: :users }, null: false
      t.references :receiver,   foreign_key: { to_table: :users }, null: false
      t.text       :post,       null: false
      t.decimal    :score,      precision: 5, scale: 3
      t.datetime   :created_at, null: false
      t.datetime   :updated_at, null: false
      t.timestamps
    end
  end
end

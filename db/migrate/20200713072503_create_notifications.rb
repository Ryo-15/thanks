class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references  :action_user,    foreign_key:{ to_table: :users }, null: false
      t.references  :passive_user,   foreign_key:{ to_table: :users }, null: false
      t.references  :post,           foreign_key: true
      t.references  :post_comment,   foreign_key: true
      t.string      :action,         null: false
      t.boolean     :checked,        null: false, default: false
      t.timestamps
    end
  end
end

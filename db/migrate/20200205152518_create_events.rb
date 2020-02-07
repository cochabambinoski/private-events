class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :content
      t.integer :user_id, foreign_key: true
      t.datetime :date

      t.timestamps
    end
    add_index :events, :user_id
  end
end

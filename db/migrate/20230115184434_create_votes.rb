class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :value, null: false

      t.references :user, null: false
      t.references :item, null: false

      t.timestamps
    end

    add_index :votes, [:user_id, :item_id], unique: true
  end
end

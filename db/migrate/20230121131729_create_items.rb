class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :kind,   null: false, default: 0
      t.string  :title,  null: false, default: ""
      t.string  :url,    null: false, default: ""
      t.text    :body,   null: false, default: ""
      t.string  :ancestry

      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :items, :ancestry
  end
end

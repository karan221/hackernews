class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.string :title,  null: false, default: ""
      t.string :url,    null: false, default: ""
      t.text :body,     null: false, default: ""
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

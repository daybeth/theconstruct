class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.references :ninja, index: true

      t.timestamps null: false
    end
    add_foreign_key :messages, :ninjas
  end
end

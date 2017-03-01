class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :stack
      t.integer :progress
      t.references :ninja, index: true

      t.timestamps null: false
    end
    add_foreign_key :projects, :ninjas
  end
end

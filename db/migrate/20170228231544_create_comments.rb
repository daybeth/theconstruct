class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :project, index: true
      t.references :ninja, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :projects
    add_foreign_key :comments, :ninjas
  end
end

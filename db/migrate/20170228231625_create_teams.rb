class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :ninja, index: true
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :teams, :ninjas
    add_foreign_key :teams, :projects
  end
end

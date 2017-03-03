class AddProjectToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :project, index: true
    add_foreign_key :messages, :projects
  end
end

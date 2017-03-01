class CreateNinjas < ActiveRecord::Migration
  def change
    create_table :ninjas do |t|
      t.string :first_name
      t.string :last_name
      t.string :ninja_name
      t.string :location

      t.timestamps null: false
    end
  end
end

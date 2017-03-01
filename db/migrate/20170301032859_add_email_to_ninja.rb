class AddEmailToNinja < ActiveRecord::Migration
  def change
    add_column :ninjas, :email, :string
  end
end

class AddPaperclipToNinja < ActiveRecord::Migration
  def change
    add_attachment :ninjas, :image
  end
end

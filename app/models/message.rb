class Message < ActiveRecord::Base
  belongs_to :ninja
  belongs_to :receiver, :foreign_key => "ninja_id", class_name: Ninja
  validates :content, presence: true, length: { in: 2..300 } ,:on => :create
end

class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :ninja
  validates :content, presence: true, length: { in: 2..300 } ,:on => :create
end

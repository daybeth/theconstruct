class Team < ActiveRecord::Base
  belongs_to :ninja
  belongs_to :project
end

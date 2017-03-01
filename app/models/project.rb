class Project < ActiveRecord::Base
  belongs_to :ninja
  has_many :comments, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :ninjas, through: :teams, dependent: :destroy
end

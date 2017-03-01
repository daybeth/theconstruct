class Ninja < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  has_many :receivers, through: :messages, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :projects_joined, through: :teams, source: :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
end

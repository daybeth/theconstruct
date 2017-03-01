class Ninja < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  has_many :receivers, through: :messages, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :projects_joined, through: :teams, source: :projects, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name ,:ninja_name, presence: true, length: { in: 2..20 } ,:on => :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX } , :on => :create
  validates :password, length: {minimum: 8}
  validates :first_name, :last_name,:ninja_name, length: { in: 2..20 }, :on => :update
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX } , :on => :update
end

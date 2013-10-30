class User < ActiveRecord::Base
  attr_accessible :login, :password, :password_confirmation, :name, :surname
  has_secure_password

  validates :login, presence: :true
  validates :password, presence: :true
  validates :password_confirmation, presence: :true
  validates :name, presence: :true

  has_many :user_groups
end

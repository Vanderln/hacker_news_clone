class User < ActiveRecord::Base
  has_many :posts
  has_many :comments

  validates :username, :uniqueness => true, :presence => true
  validates :password, :presence => true
end

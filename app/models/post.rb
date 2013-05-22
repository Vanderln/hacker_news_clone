class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :url, :presence => true
  validates :title, :presence => true

end

class Article < ActiveRecord::Base
  has_many :comments

  validates :title, :body, presence: true
end

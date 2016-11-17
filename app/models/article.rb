class Article < ActiveRecord::Base
  has_many :comments, inverse_of: :article, dependent: :destroy
  validates_presence_of :content, :title
end

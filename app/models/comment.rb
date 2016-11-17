class Comment < ActiveRecord::Base
  belongs_to :article, inverse_of: :comments
  validates_presence_of :body
end

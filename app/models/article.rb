class Article < ActiveRecord::Base
  has_many :comments, inverse_of: :article, dependent: :destroy
end

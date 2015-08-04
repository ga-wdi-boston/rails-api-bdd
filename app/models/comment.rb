class Comment < ActiveRecord::Base
  belongs_to :article, inverse_of: :comments
end

class AddArticleToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :article, index: true, foreign_key: true
  end
end

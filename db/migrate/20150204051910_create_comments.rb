class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :article, index: true
    end
    add_foreign_key :comments, :articles
  end
end

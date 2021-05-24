class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.belongs_to :post
      t.belongs_to :member

      t.timestamps
    end
  end
end

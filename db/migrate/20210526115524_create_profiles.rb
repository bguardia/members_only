class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.text :bio
      t.belongs_to :member
      
      t.timestamps
    end
  end
end

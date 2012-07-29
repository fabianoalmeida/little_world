class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name, :null => false
      t.decimal :latitude, :precision => 15, :scale => 12
      t.decimal :longitude, :precision => 15, :scale => 12

      t.timestamps
    end
    
    add_index :friends, [:latitude, :longitude], :unique => true
  end
end

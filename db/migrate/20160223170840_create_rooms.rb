class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :location
      t.text :description

      t.timestamps
    end

    add_index :reviews, :user_id
	add_index :reviews, :room_id

	add_index :reviews, [:user_id, :room_id], :unique => true
	
  end
end

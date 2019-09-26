class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :friend_id
      t.boolean :status, default: false
     
      t.timestamps
    end
  end
end

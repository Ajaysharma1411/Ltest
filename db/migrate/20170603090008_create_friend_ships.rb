class CreateFriendShips < ActiveRecord::Migration
  def change
    create_table :friend_ships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :friend, index: true, foreign_key: true

      t.boolean :accepted,default: :false

      t.timestamps null: false
    end
  end
end

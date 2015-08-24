class CreateAttempts < ActiveRecord::Migration
  def change
    create_table :attempts do |t|
      t.boolean :correct
      t.integer :user_id
      t.integer :character_id

      t.timestamps

    end
  end
end

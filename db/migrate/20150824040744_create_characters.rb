class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :language
      t.string :translation
      t.string :tone
      t.string :english_spelling
      t.string :character

      t.timestamps

    end
  end
end

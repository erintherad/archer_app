class AddPhotoToCharacter < ActiveRecord::Migration
  def up
    add_attachment :characters, :photo
  end

  def down
    remove_attachment :characters, :photo
  end
end

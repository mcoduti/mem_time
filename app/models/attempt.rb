class Attempt < ActiveRecord::Base

  #validates :correct, :presence => true #:uniqueness => true
  validates :user_id, :presence => true #:uniqueness => true
  validates :character_id, :presence => true #:uniqueness => true

belongs_to :character , :class_name => "Character", :foreign_key => "character_id"
belongs_to :user , :class_name => "User", :foreign_key => "user_id"

end

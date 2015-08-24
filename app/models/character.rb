class Character < ActiveRecord::Base
  validates :language, :presence => true #:uniqueness => true
  validates :translation, :presence => true #:uniqueness => true
  validates :tone, :presence => true #:uniqueness => true
  validates :english_spelling, :presence => true #:uniqueness => true
  validates :character, :presence => true #:uniqueness => true

has_many :attempts , :class_name => "Attempt", :foreign_key => "character_id"

has_many :users, :through => :attempts

end

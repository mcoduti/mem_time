class Character < ActiveRecord::Base
  validates :language, :presence => true #:uniqueness => true
  validates :translation, :presence => true #:uniqueness => true
  validates :tone, :presence => true #:uniqueness => true
  validates :english_spelling, :presence => true #:uniqueness => true
  validates :character, :presence => true #:uniqueness => true



end

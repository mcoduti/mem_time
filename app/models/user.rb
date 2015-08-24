class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  has_many :attempts , :class_name => "Attempt", :foreign_key => "user_id"
  has_many :characters, :through => :attempts


  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

class User < ActiveRecord::Base
  devise :omniauthable
  validates_presence_of :email, :encrypted_password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

class User < ActiveRecord::Base
  validates_presence_of :email, :encrypted_password
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

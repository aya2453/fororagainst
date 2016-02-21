class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articlelikes
  has_many :articles
  has_many :articlelike_note, through: :articlelikes, source: :note
  has_many :agrees
  has_many :disagrees
end

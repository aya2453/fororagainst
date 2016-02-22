class Article < ActiveRecord::Base
  belongs_to :user
  has_many :articlelikes, dependent: :destroy
  has_many :comments
  acts_as_votable
  def like_user(user_id)
    articlelikes.find_by(user_id: user_id)
  end
end

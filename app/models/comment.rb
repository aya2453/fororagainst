class Comment < ActiveRecord::Base
  belongs_to :article
  enum status: %w(賛成 反対)
end

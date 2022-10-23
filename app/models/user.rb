class User < ApplicationRecord
  has_many :articles

  enum role: {
    writer: 0,
    moderator: 1,
  }

  validates :email, presence: true

  has_secure_password
end

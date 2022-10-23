class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true

  enum role: {
    writer: 0,
    moderator: 1,
  }
end

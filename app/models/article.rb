class Article < ApplicationRecord
  belongs_to :user

  enum status: {
    draft: 0,
    review: 1,
    scheduled: 2,
    published: 3,
  }

  validates :title, presence: true
end

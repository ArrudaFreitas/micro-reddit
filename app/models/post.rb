class Post < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
  has_many :comments

  validates :head, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { minimum: 10 }
end

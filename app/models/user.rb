class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  before_save :downcase_email
  before_create :set_uuid

  private
    def downcase_email
      self.email = email.downcase
    end

    def set_uuid
      self.id = SecureRandom.uuid
    end
end

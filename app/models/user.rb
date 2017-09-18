class User < ApplicationRecord
  PASSWORD_LENGTH = (6..25)
  validates :password, length: PASSWORD_LENGTH, allow_nil: true

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 254 },
                                    uniqueness: { case_sensitive: false }

  has_secure_password
end
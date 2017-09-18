class User < ApplicationRecord
  PASSWORD_LENGTH = (6..25)
  validates :password, length: PASSWORD_LENGTH, allow_nil: true

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 254 },
                                    uniqueness: { case_sensitive: false }

  has_secure_password
  def is_password?(password_attempt)
    BCrypt::Password.new(password_digest).is_password?(password_attempt)
  end

  def password=(raw_password)
    self.password_digest = BCrypt::Password.create(raw_password)
  end

  def self.find_from_credentials(email, password)
    user = find_by(email: email) # same as User.find_by( ... )
    return nil unless user
    user if user.is_password?(password)
  end
end
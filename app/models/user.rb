class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 40 }
  validates :email, presence: true, length: { maximum: 200 }, 
                                    uniqueness: { case_sensitive: false }
end
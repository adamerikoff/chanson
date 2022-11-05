class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 5 }
end

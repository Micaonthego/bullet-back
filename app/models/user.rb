class User < ApplicationRecord
    has_many :bullets

    has_secure_password
  validates :username, uniqueness: true
end

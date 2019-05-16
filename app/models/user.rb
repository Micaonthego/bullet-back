class User < ApplicationRecord
    has_many :bullets

    has_secure_password
  validates :name, uniqueness: true
end

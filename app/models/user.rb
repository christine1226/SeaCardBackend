class User < ApplicationRecord
  has_many :scores
  has_many :activities, through: :scores
  has_secure_password

  validates :parent_name, :parent_email, :password_digest, :child_username, presence: true
  validates :password_digest, length: { minimum: 5 }
  # validates :parent_email, uniqueness: true
end

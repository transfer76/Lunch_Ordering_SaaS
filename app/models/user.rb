class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }
  validates :phone, numericality: true, length: { minimum: 10, maximum: 15 },
            allow_blank: true
end

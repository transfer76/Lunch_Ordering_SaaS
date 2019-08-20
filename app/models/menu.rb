class Menu < ApplicationRecord
  has_and_belongs_to_many :items

  validates :date, presence: true
end

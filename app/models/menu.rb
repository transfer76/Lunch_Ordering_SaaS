class Menu < ApplicationRecord
  has_and_belongs_to_many :items

  validates :date, presence: true

  accepts_nested_attributes_for :items
end

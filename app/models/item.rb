class Item < ApplicationRecord
  enum type: [:first_course, :main_course, :drink]

  has_and_belongs_to_many :orders
  has_and_belongs_to_many :menus

  validates :type, :price, presence: true
  validates :name, length: { minimum: 3 }, presence: true

end

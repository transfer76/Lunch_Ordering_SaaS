class Item < ApplicationRecord
  has_and_belongs_to_many :order
  has_and_belongs_to_many :menus
end

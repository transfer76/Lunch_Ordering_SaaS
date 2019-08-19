class Item < ApplicationRecord
  has_and_belongs_to_many :orders
  has_and_belongs_to_many :menus
end

class Order < ApplicationRecord
  has_and_belongs_to_many :items

  belongs_to :menu
  belongs_to :user

  accepts_nested_attributes_for :items
end

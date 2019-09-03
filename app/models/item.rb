class Item < ApplicationRecord
  enum course: [:first_course, :main_course, :drink]

  has_and_belongs_to_many :menus

  validates :course, :price, presence: true
  validates :name, length: { minimum: 3 }, presence: true

  mount_uploader :photo, PhotoUploader
end

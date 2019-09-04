class Menu < ApplicationRecord
  has_and_belongs_to_many :items, -> { order(:course) }
  has_many :orders

  validates :date, presence: true, format: /\A\d{4}-\d{2}-\d{2}\z/, uniqueness: true
  validate :validate_date

  accepts_nested_attributes_for :items, allow_destroy: true

  def current?
    date == Date.today.strftime('%Y-%m-%d')
  end

  def first_courses
    items.first_course
  end

  def main_courses
    items.main_course
  end

  def drinks
    items.drink
  end

  def weekday
    Date.strptime(date, '%Y-%m-%d').strftime('%A %Y-%m-%d')
  end

  private

  def validate_date
    Date.strptime(date, '%Y-%m-%d')
  rescue ArgumentError
    errors.add(:date, :invalid)
  end
end

class Order < ApplicationRecord
  belongs_to :menu
  belongs_to :user

  belongs_to :first_course, class_name: 'Item', optional: true
  belongs_to :main_course, class_name: 'Item', optional: true
  belongs_to :drink, class_name: 'Item', optional: true

  validate :validate_current_day
  validate :validate_item_present

  before_save :total_price_for_order

  def total_price_for_order
    a = 0
    b = 0
    c = 0

    a = first_course.price if first_course.present?
    b = main_course.price if main_course.present?
    c = drink.price if drink.present?

    self.price = (a + b + c)
  end

  private

  def validate_current_day
    unless menu&.current?
      errors.add(:menu_id, :invalid)
    end
  end

  def validate_item_present
    unless [first_course, main_course, drink].any?
      errors.add(:order, alert: 'One of courses must be present')
    end
  end
end

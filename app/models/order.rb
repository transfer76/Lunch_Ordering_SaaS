class Order < ApplicationRecord
  belongs_to :menu
  belongs_to :user

  belongs_to :first_course, class_name: 'Item', optional: true
  belongs_to :main_course, class_name: 'Item', optional: true
  belongs_to :drink, class_name: 'Item', optional: true

  validate :validate_current_day

  private

  def validate_current_day
    unless menu&.current?
      errors.add(:menu_id, :invalid)
    end
  end
end

module MenusHelper
  def total_price_for_order(order)
    a = 0
    b = 0
    c = 0

    a = order.first_course.price if order.first_course.present?
    b = order.main_course.price if order.main_course.present?
    c = order.drink.price if order.drink.present?

    return a + b + c
  end
end

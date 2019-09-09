class OrderSerializer < ActiveModel::Serializer
  attributes :id, :menu_id, :first_course_id, :main_course_id, :drink_id, :price, :username
end

json.users @users_with_orders do |(user, orders)|
  json.username user.username
  json.orders orders do |order|
    json.first_course do
      json.partial! 'item', item: order.first_course
    end

    json.main_course do
      json.partial! 'item', item: order.main_course
    end

    json.drink do
      json.partial! 'item', item: order.drink
    end
  end
end

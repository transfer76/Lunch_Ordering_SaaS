module Api
  module V1
    class OrdersController < BaseController
      def index
        orders = Menu.current.orders

        @users_with_orders = orders.to_a.group_by { |order| order.user }
      end
    end
  end
end

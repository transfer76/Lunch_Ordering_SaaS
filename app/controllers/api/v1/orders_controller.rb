module Api
  module V1
    class OrdersController < BaseController
      def index
        if @menu.current?
          @orders = @menu.orders.where(user_id: current_user.id)
        end

        render json: @orders
      end
    end
  end
end

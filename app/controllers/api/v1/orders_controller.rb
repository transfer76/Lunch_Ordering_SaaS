class Api::V1::OrdersController < Api::V1::BaseController
  def index
    @orders = @menu.orders.where(user_id: current_user.id)

    render json: @orders
  end
end

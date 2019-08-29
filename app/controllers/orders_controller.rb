class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show]

  def index
    @orders = Order.all
  end

  def show
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      redirect_to @order.menu, notice: 'Order was successfully created.'
    else
      redirect_to @order.menu, alert: 'Order was not created'
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.fetch(:order, {}).permit(:id, :menu_id, :first_course_id, :main_course_id, :drink_id)
  end
end

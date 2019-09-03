class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  def index
    @menus = Menu.where('created_at >= ?', 5.days.ago).order(date: :asc, ).all

    authorize @menus
  end

  def show
    if @menu.current?
      @order = @menu.orders.build
    end

    @user_order = @menu.orders.where(user_id: current_user.id)
    @total = @menu.orders.where(@order.price).sum(:price)

    authorize @menu
  end

  def new
    @menu = Menu.new
    @menu.items.build

    authorize @menu
  end

  def edit
    @menu.items.build

    authorize @menu
  end

  def create
    @menu = Menu.new(menu_params)

    authorize @menu

    if @menu.save
      redirect_to menus_path, notice: 'Menu was successfully created.'
    else
      render :new
    end
  end

  def update
    authorize @menu

    if @menu.update(menu_params)
      redirect_to @menu, notice: 'Menu was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @menu

    @menu.destroy
    redirect_to menus_url, notice: 'Menu was successfully destroyed.'
  end

  private

  def set_menu
    @menu = Menu.includes(:items).find(params[:id])
  end

  def menu_params
    params.fetch(:menu, {}).permit(:date, items_attributes: [:id, :course, :name, :price, :photo, :_destroy])
  end
end

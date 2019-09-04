class ItemsController< ApplicationController
  before_action :authenticate_user!
  before_action :set_menu
  before_action :set_item, only: [:edit, :update, :destroy]


  def new
    @item = @menu.items.new

    authorize @item
  end

  def edit
   authorize @item
  end

  def create
    @item = @menu.items.new(item_params)

    authorize @item

    if @items.save
      redirect_to @menu, notice: I18n.t('controllers.item.created')
    else
      render :new
    end
  end

  def update
    authorize @item

    if @item.update(item_params)
      redirect_to @menu, notice: I18n.t('controllers.item.updated')
    else
      render :edit
    end
  end

  def destroy
    authorize @item

    @item.destroy!
    redirect_to menu_url(@menu), notice: I18n.t('controllers.item.destroyed')
  end

  private

  def set_menu
      @menu = Menu.find(params[:menu_id])
  end

  def set_item
    @item = @menu.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:course, :name, :photo, :price)
  end
end

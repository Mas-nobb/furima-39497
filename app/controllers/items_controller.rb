class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    puts item_params # 追加した行
    if @item.save
      redirect_to root_path, notice: "商品が出品されました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :shipping_day_id, :prefecture_id, :shipping_fee_status_id, :price)
  end
end

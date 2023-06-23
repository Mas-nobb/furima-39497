class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  # before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: '商品が出品されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end
  

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id), notice: '商品が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def destroy
  #   if @item.destroy
  #     redirect_to root_path, notice: '商品が削除されました。'
  #   else
  #     redirect_to root_path, alert: '商品の削除に失敗しました。'
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :shipping_day_id, :prefecture_id,
                                 :shipping_fee_status_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # def move_to_index
  #   redirect_to root_path unless current_user.id == @item.user_id
  # end
end

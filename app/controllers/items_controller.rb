class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
    @item_sold = @item.order.present? # 売却済みかどうかを確認
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
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
    return unless @item.order.present? # 売却済みであれば

    redirect_to root_path # トップページにリダイレクト
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id), notice: '商品が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user && current_user.id == @item.user_id
      if @item.destroy
        redirect_to root_path, notice: '商品が削除されました。'
      else
        redirect_to root_path, alert: '商品の削除に失敗しました。'
      end
    else
      redirect_to root_path, alert: '権限がありません。'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :shipping_day_id, :prefecture_id,
                                 :shipping_fee_status_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

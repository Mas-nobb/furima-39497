class OrdersController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect_if_not_eligible, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @orderform = OrderForm.new
  end

  def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      pay_item
      @orderform.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
=======
  def index
>>>>>>> parent of 145653a (購入機能の実験)
  end

  def redirect_if_not_eligible
    if @item.sold? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end

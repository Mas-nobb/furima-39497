class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    gon.payjp_public_key = ENV['PAYJP_PUBLIC_KEY']
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
    params.require(:order_form).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number, :token).merge(item_id: params[:item_id], user_id: current_user.id,token: params[:token])
  end

  def pay_item
    set_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # or something else depends on your design
      card: order_params[:token], # card token
      currency: 'jpy' # Japanese yen
    )
  end
end

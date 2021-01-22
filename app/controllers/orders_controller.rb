class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    # 購入済みまたは出品者
    return redirect_to root_path if Order.where(item_id: @item.id).any? || current_user.id == @item.user_id
    @order_address = OrderAddress.new
  end

  def new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid? # => Validation
      pay_item
      @order_address.save
      # Success
      redirect_to root_path
    else
      # Failure
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
          .merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

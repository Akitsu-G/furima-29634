class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save # => Validation
      # Success
      redirect_to root_path
    else
      # Failure
      render action: :new
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to root_path
  end

  def edit
    # 購入済みまたは出品者ではない
    return redirect_to root_path if Order.where(item_id: @item.id).any? || current_user.id != @item.user_id
  end

  def update
    if @item.update(item_params) # => Validation
      # Success
      redirect_to item_path(@item.id)
    else
      # Failure
      render action: :edit
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item)
          .permit(:id, :image, :product_name, :description,
                  :category_id, :condition_id, :contribution_id, :prefecture_id,
                  :days_to_ship_id, :selling_price, :created_at, :updated_at)
          .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

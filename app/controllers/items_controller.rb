class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @items = Item.order('created_at DESC')
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

  private

  def item_params
    params.require(:item)
          .permit(:id, :image, :product_name, :description,
                  :category_id, :condition_id, :contribution_id, :prefecture_id,
                  :days_to_ship, :selling_price, :created_at, :updated_at)
          .merge(user_id: current_user.id)
  end
end

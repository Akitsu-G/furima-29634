class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update]

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
    # item = Item.find(params[:id])
    # item.destroy
  end

  def edit
  end

  def update
    # item.update(item_params)
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

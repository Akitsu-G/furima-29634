class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # session初期化
  before_action :session_initialize

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private

  def session_initialize
    session[:user] = nil
  end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :condition_id, :delivery_fee_id, :prefectures_id,
                                 :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index if (current_user.id != @item.user_id) || @item.order.present?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
      if @item_order.valid?
        @item_order.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefectures, :municipality, :house_number, :building_name, :phone_number)
  end

  
end

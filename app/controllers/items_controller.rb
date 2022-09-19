class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end


private

  def prototype_params
    params.require(:item).permit(:name, :explanation, :price, :category_id, :condition_id, :delivery_charge_id, :area_id, :days_id).merge(user_id: current_user.id)
  end

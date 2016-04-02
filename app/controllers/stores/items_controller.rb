class Stores::ItemsController < ApplicationController
  def edit
    @store = Store.find_by(slug: params[:store_name])
    @item = Item.find_by(params[:id])
  end

  def update
    @store = Store.find_by(slug: params[:store_name])
    @item = @store.items.find_by(params[:id])
    if @item.update_attributes(item_params)
      flash[:notice] = "You have successfully updated #{@item.name}."
      redirect_to items_path(@item)
    end
  end

private

  def item_params
    params.require(:item).permit(:name)
  end
end

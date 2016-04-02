class Stores::ItemsController < ApplicationController
  def edit
    @store = Store.find_by(slug: params[:store_name])
    @item = Item.find(params[:id])
  end

  def update
    @store = Store.find_by(slug: params[:store_name])
    @item = @store.items.find(params[:id])
    if @item.update_attributes(item_params)
      flash[:notice] = "You have successfully updated #{@item.name}."
      redirect_to item_path(@store.slug, @item)
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @store = Store.find_by(slug: params[:store_name])
    @items = @store.items.all
  end
private

  def item_params
    params.require(:item).permit(:name)
  end
end

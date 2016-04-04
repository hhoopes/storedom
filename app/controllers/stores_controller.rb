class StoresController < ApplicationController
  def index
    @stores = Store.approved
  end

  def show
    @store = Store.find_by(slug: params[:store_name])
  end

end

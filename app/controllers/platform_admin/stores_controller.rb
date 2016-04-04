class PlatformAdmin::StoresController < ApplicationController
  def index
    @stores = Store.all
  end

  def update
    @store = Store.find(params[:id])
    @store.update_attributes(approval: params[:approved])
    redirect_to platform_admin_stores_path
    flash[:notice] = "You successfully modified the approval for #{@store.name}"
  end
end

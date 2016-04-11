module Api
  module V1
    class ItemsController < ApiController
      respond_to :json, :xml

      def index
        respond_with Item.all
      end

      def show
        respond_with Item.find_by(id: params[:id])
      end

      def create
        respond_with Item.create(item_params)
      end

      def update
        respond_with Item.update(params[:id], item_params) # will return 204 no content, but expected behavior
      end

      def destroy
        respond_with Item.destroy(params[:id])
      end

    private

      def item_params
        params.require(:item).permit(:name, :description, :image_url)
      end
    end
  end
end

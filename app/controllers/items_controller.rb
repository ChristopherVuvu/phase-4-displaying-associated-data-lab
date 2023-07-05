class ItemsController < ApplicationController
    def index
        items = Item.includes(:user)
        render json: items_with_user(items), status: :ok
    end
    
    private
    
    def items_with_user(items)
        items.as_json(
            only: [:id, :name, :description, :price],
            include: { user: { only: [:id, :username, :city] } }
        )
    end
end

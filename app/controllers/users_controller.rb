class UsersController < ApplicationController
    def show
        user = User.find(params[:id])
        render json: user_with_items(user), status: :ok
    end
    
    private
    
    def user_with_items(user)
        {
            id: user.id,
            username: user.username,
            city: user.city,
            items: user.items.as_json(only: [:id, :name, :description, :price])
        }
    end
end

class HikesController < ApplicationController
    def create
        hike = Hike.create(hike_params)
        render json: hike.as_json(include: {trail: {
            only: [:name, :location, :img_medium, :id]
        }})
    end


    private

    def hike_params
        params.require(:hike).permit(:user_id, :trail_id, :completed)
    end
   
end
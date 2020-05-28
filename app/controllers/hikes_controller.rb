class HikesController < ApplicationController
    def create
        hike = Hike.create(hike_params)
        render json: hike.as_json(include: {trail: {
            only: [:name, :location, :img_medium, :id, :condition_status]
        }})
    end

    def update
        hike = Hike.find(params[:id])
        hike.update(hike_params)
        render json: hike.as_json(include: {trail: {
            only: [:name, :location, :img_medium, :id, :condition_status]
        }})
    end

    def destroy
        hike= Hike.find(params[:id])
        hike.destroy
    end

    private

    def hike_params
        params.require(:hike).permit(:user_id, :trail_id, :completed, :rating, :favorite)
    end
   
end
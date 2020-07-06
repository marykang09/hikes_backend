class TrailsController < ApplicationController

    def index 
        trails = Trail.all
        render json: trails.as_json(include: {comments: {
            include: :user
        }})
    end
 
end

class TrailsController < ApplicationController

    def index 
        render json: Trail.all
    end

 
end

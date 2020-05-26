class UsersController < ApplicationController

    def show
        user = User.find(params[:id])
         render json: user.as_json(include: {hikes: {
                                        include: {trail: {
                                            only: [:name, :location, :img_medium, :id]}},
                                        except: [:created_at, :updated_at]
                                            }})
       
    end
    
end

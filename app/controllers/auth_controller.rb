class AuthController < ApplicationController

    def create
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode(payload)
            new_hash = {}
            new_hash['user_data'] = user.as_json(include: {hikes: {
                include: {trail: {
                    only: [:name, :location, :img_medium, :id, :condition_status]}},
                except: [:created_at, :updated_at]
                    }})
            new_hash["token"] = token

            render json: new_hash
        else
            render json: {
              error_message: "Incorrect username or password"
            }
        end
    end


end

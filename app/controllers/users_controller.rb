class UsersController < ApplicationController
    

    def show
        user = User.find(params[:id])
        render json: user.as_json(include: {hikes: {
                                        include: {trail: {
                                            only: [:name, :location, :img_medium, :id, :condition_status]}},
                                        except: [:created_at, :updated_at]
                                            }})
       
    end

    def index
        render json: User.all
    end


    def create
        user = User.create(user_params)
        user.update(password: params[:password])
        payload = {user_id: user.id}
        token = encode(payload)
        new_hash = {}
        new_hash['user_data'] = user
        new_hash["token"] = token
        render json: new_hash
    end

    def decode_token
        token = request.headers["Authenticate"]
        user = User.find(decode(token)["user_id"])
        render json: user
    end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name)
  end
    
end

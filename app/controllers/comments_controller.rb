class CommentsController < ApplicationController

    def create
        comment = Comment.create(comment_params)
        render json: comment.as_json(include: :user)
    end

    def destroy 
        c = Comment.find(params[:id])
        c.destroy
    end
    private

    def comment_params 
        params.require(:comment).permit(:user_id, :content, :trail_id)
    end
end

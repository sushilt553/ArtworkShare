class CommentsController < ApplicationController

    def index
        if params[:user_id]
            comments = Comment.where(commenter_id: params[:user_id])
            render json: comments
        elsif params[:artwork_id]
            comments = Comment.where(artwork_id: params[:artwork_id])
            render json: comments
        else
            render json: Comment.all
        end
    end

    def create
        comment = Comment.new(comment_params)

        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        if comment
            comment.destroy
            render json: "Successfully deleted"
        else
            render json: "Comment not found"
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter_id, :artwork_id, :body)
    end
end

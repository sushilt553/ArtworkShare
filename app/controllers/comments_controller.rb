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

    def like
        like = Like.new(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Comment')

        if like.save
            render json: like
        else
            render json: like.errors.full_messages, status: :unprocessable_entity
        end
    end

    def unlike
        like = Like.find_by(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Comment')

        if like
            like.destroy
            render json: "Unliked"
        else
            render json: "Cannot be unliked"
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter_id, :artwork_id, :body)
    end
end

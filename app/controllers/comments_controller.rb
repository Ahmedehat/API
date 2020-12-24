class CommentsController < ApplicationController
before_action :set_comment,  only: [:update , :destroy , :show]
before_action :set_card
	def index
		comments = @card.comments
		render json: comments
	end
	def show
		render json: @comment
	end
	def create
		comment = @card.comments.new(comment_params)
		if comment.save
			render json: comment
		else
			render json: comment.errors
		end
	end
	def update
		if @comment.update(comment_params)
			render json: @comment
		else
			render json: @comment.errors
		end
	end
	def destroy
		@comment.destroy
		render json: @comment
	end
private
	def set_comment
		@comment = Comment.find_by(id: params[:id])
		render json: "comment not found" if @comment.nil?
	end
	def set_card
		@card = Card.find(params[:card_id])
		render json: "card not found" if @card.nil?
	end


	def comment_params
		params.require(:comment).permit(:content)
	end
end

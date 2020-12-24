class CardsController < ApplicationController
before_action :set_card,  only: [:update , :destroy , :show ]
before_action :set_list
	def index
		cards = @list.cards 	
		render json: cards
	end
	def show
		render json: @card			
	end
	def create
		card = @list.cards.new(card_params)
		if card.save
			render json: card
		else
			render json: card.errors
		end
	end
	def update
		if @card.update(card_params)
			render json: @card
		else
			render json: @card.errors
		end
	end
	def destroy
		@card.destroy
		render json: @card
	end
private
	def set_card
		@card = Card.find_by(id: params[:id])
		render json: "record not found" if @card.nil?
	end
	def set_list
		@list = List.find(params[:list_id])
		render json: "list not found" if @list.nil?
	end
	def card_params
		params.require(:card).permit(:title ,:description)
	end
end

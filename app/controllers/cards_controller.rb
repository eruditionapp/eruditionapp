class CardsController < ApplicationController

  def show
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:id])
  end

  def edit
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:deck_id])
    @card = Card.find(param[:id])
    if @card.update_attributes(strong_params)
      flash[:success] = 'Card updated.'
      redirect_to @deck
    else
      flash[:error] = 'Unable to update card.'
      render 'edit'
    end
  end

  def new
    @deck = Deck.find(params[:deck_id])
    @card = Card.new
  end

  def create
    @deck = Deck.find(param[:deck_id])
    @card = Card.new(strong_params)
    if @deck.cards << @card
      flash[:success] = 'Card created.'
      redirect_to @deck
    else
      flash[:error] = 'Failed to create card.'
      render 'new'
    end
  end

  private

    def strong_params
      params.require(:card).permit(:type, :difficulty, :content)
    end
end

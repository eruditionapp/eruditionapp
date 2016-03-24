class DecksController < ApplicationController

  def index
    @decks = Deck.all.order(:title)
  end

  def show
    @deck = Deck.find(params[:id])
    @categories = @deck.categories
    @cards = @deck.cards
  end

  def edit
    @deck = Deck.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:id])
    if @deck.update_attributes(strong_params)
      flash[:success] = 'Deck updated.'
      redirect_to @deck
    else
      flash[:error] = 'Failed to update deck.'
      render 'edit'
    end
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(strong_params)
    if @deck.save
      flash[:success] = "Deck '#{@deck.title}'' created."
      redirect_to decks_path
    else
      flash[:error] = 'Failed to create deck.'
      render 'new'
    end
  end

  private

    def strong_params
      params.require(:deck).permit(:title, :subtitle, :author)
    end
end

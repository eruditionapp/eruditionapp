class QuotesController < ApplicationController

  def index
    @deck = Deck.find(params[:deck_id])
    @quotes = @deck.quotes
  end

  def show
    @deck = Deck.find(params[:deck_id])
    @quote = Quote.find(params[:id])
  end

  def edit
    @deck = Deck.find(params[:deck_id])
    @quote = Quote.find(params[:id])
  end

  def update
    @deck = Deck.find(params[:deck_id])
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(strong_params)
      flash[:success] = "Quote updated."
      redirect_to deck_quote_path(@deck, @quote)
    else
      flash[:error] = "Failed to update quote."
      render 'edit'
    end
  end

  def new
    @deck = Deck.find(params[:deck_id])
    @quote = Quote.new
  end

  def create
    @deck = Deck.find(params[:deck_id])
    @quote = Quote.new(strong_params)
    if @deck.quotes << @quote
      flash[:success] = "Quote updated."
      redirect_to deck_quote_path(@deck, @quote)
    else
      flash[:error] = "Failed to update quote."
      render 'edit'
    end
  end

  private

    def strong_params
      params.require(:quote).permit(:content)
    end
end

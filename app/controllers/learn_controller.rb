class LearnController < ApplicationController
  layout 'learn'

  def index
    @user = User.find(params[:id])
    @deck = Deck.find(params[:deck_id])
    @series = Learn.series(@user, @deck)
  end

  def card_prompt
    @user = User.find(params[:id])
    @deck = Deck.find(params[:deck_id])
    @prompt = Learn.series(@user, @deck)[:cards][2]

    respond_to do |format|
      format.js   {}
    end
  end

  def card_response
    @user = User.find(params[:id])
    @deck = Deck.find(params[:deck_id])
    @response = Learn.series(@user, @deck)[:cards][2]

    respond_to do |format|
      format.js   {}
    end
  end
end

class LearnController < ApplicationController

  layout 'learn'

  def index
    @user = User.find(params[:id])
    @deck = Deck.find(params[:deck_id])
    @series = Learn.series(@user, @deck)
  end
end

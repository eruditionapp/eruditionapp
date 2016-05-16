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

  def create_card_response
    @user = User.find(params[:id])
    @deck = Deck.find(params[:deck_id])
    quote = 10
    card = 66
    response_was_correct = check_answer
    card_response = CardResponse.new user: @user, deck: @deck, quote_id: quote,
      card_id: card, response_was_correct: response_was_correct
    card_response.save
    redirect_to "/learn/#{@user.id}/#{@deck.id}"
  end

  def check_answer
    # this is also where we'd put some regex to lowercase and
    # strip punctuation, and whitespace. maybe other things like
    # trailing 's' / 'es' as well.. not sure (ruby can probably
    # singularize text)
    params[:card_response]['correct_answer'] == params[:card_response]['answer']
  end
end

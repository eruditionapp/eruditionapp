class LearnController < ApplicationController
  layout 'learn'

  def index
    @user            = User.find(params[:id])
    @deck            = Deck.find(params[:deck_id])
    session[:series] = Learn.series(@user, @deck)
    @current_card    = session[:series]['cards'][session[:series]['card_index']]
    @quote           = session[:series]['quote']['content']
    @cards_remaining = session[:series]['card_index'] < session[:series]['cards'].count
  end

  def get_card_prompt
    @user         = User.find(params[:id])
    @deck         = Deck.find(params[:deck_id])
    @current_card = session[:series]['cards'][session[:series]['card_index']]

    respond_to do |format|
      format.js   {}
    end
  end

  def post_user_response
    @user      = User.find(params[:id])
    @deck      = Deck.find(params[:deck_id])
    difficulty = session[:series]['difficulty']

    @response_was_correct = create_card_response @user, @deck
    update_difficulty? difficulty, @user.id, @deck.id if @response_was_correct

    session[:series]['card_index'] += 1
    @cards_remaining = session[:series]['card_index'] < session[:series]['cards'].count

    respond_to do |format|
      format.js   {}
    end
  end

  def create_card_response user, deck
    quote                = session[:series]['quote']['id']
    current_card         = session[:series]['cards'][session[:series]['card_index']]
    response_was_correct = check_answer
    card_response = CardResponse.new user: user, deck: deck, quote_id: quote,
      card_id: current_card['id'], response_was_correct: response_was_correct

    card_response.save
    response_was_correct
  end

  def check_answer
    # this is also where we'd put some regex to lowercase and
    # strip punctuation, and whitespace. maybe other things like
    # trailing 's' / 'es' as well.. not sure (ruby can probably
    # singularize text)
    params[:card_response]['correct_answer'] == params[:card_response]['answer']
  end

  def update_difficulty? difficulty, user_id, deck_id
    if Learn::CARDS_NEEDED_TO_PASS <= Card.not_due(user_id, deck_id).where(difficulty: difficulty).length
      CurrentDifficulty.create difficulty: difficulty + 1, user_id: user_id, deck_id: deck_id
    end
  end
end

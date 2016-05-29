class DecksController < ApplicationController
  before_action :authenticate_user!
  before_action :superadmin_or_admin_only

  def index
    if params[:category].present?
      @decks = Category.filter_decks(params[:category]).paginate(page: params[:page])
    else
      @decks = Deck.paginate(page: params[:page]).order(:title)
      @decks = @decks.scope_status(params[:status]) if params[:status].present?
      @decks = @decks.scope_tier(params[:tier])     if params[:tier].present?
    end
    @categories = Category.all
  end

  def show
    @deck = Deck.find(params[:id])
    @categories = @deck.categories
    @cards = @deck.cards.paginate(page: params[:page])
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
      params.require(:deck).permit(:title, :subtitle, :author, :status, :tier)
    end
end

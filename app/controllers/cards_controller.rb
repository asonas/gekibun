class CardsController < ApplicationController
  def index
  end

  def new
    @card = Card.new
  end

  def show
    @card = Card.all
  end

  def create
    @card = Card.create(param[:card])
    redirect_to @card
  end

  def card
  end

end

# -*- coding: utf-8 -*-
class CardsController < ApplicationController
  def index
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(params[:card])
    
    @card.save
    redirect_to "/cards/new"
  end

  def card
    @card = Card.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @card }
    end
  end
end

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
    if params[:id]
      @card = Card.find_by_big_id(params[:id])
    else
      @card = Card.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @card }
    end
  end
end

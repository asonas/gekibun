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
  
  def batch
    #NG
    pattarn = "/(ちんこ)|(チンコ)|(まんこ)|(マンコ)|(馬鹿)|(バカ)|(死ね)|(レイプ)|(うざい)|(厨)|(エロ)/"
    
    search = Twitter::Search.new
    search.containing("#津山弥生祭").language("ja").result_type("recent").each do |r|
      card = Card.find_by_tweet_id(r.id)
      if card.nil?
        card = Card.new(:message => r.text, :tweet_id => r.id, :twitter_user_id => r.from_user_id, :twitter_user_name => r.from_user)
        card.save
      end
    end
  end
end

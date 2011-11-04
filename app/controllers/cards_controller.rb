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
    #db_path = "/home/asonas/www/gekibun/db/development.sqlite3"
    search = Twitter::Search.new
    search.containing("#津山弥生祭").language("ja").result_type("recent").each do |r|
      #hoge = db.execute('select * from cards where tweet_id = ?', r.id)
      card = Card.find_by_tweet_id(r.id)
      if card.empty?
        card = Card.new(:message => r.text, :tweet_id => r.id)
        card.save
      end
      #db = SQLite3::Database.new(db_path)
      #hoge = db.execute('select * from cards where tweet_id = ?', r.id)
      #db.close
      #if card.empty?
        #Card.create(:message => r.text, :tweer_id => r.id)
        #insdb = SQLite3::Database.new(db_path)
        ##new_item = {:message => r.text, :tweet_id => r.id}
        #sql = "insert into cards values (:id, :message, :tweet_id, :created_at, :updated_at)"
        #insdb.execute(sql, new_item)
        #insdb.close
      #end
    end
  end
end

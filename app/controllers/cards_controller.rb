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
  search = Twitter::Search.new
search.containing("#津山弥生祭").language("ja").result_type("recent").each do |r|
  #puts r
  p r.id
  db = SQLite3::Database.new("/home/asonas/www/gekibun/db/development.sqlite3")
  hoge = db.execute('select * from cards where tweet_id = ?', r.id)
  db.close
  p hoge
  if hoge.empty?
    insdb = SQLite3::Database.new("/home/asonas/www/gekibun/db/development.sqlite3")
    new_item = {:message => r.text, :tweet_id => r.id}
    sql = "insert into cards values (:id, :message, :tweet_id, :created_at, :updated_at)"
    insdb.execute(sql, new_item)
    insdb.close
  end
end
  end
end

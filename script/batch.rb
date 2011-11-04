# -*- coding: utf-8 -*-
require 'twitter'
require 'sqlite3'

search = Twitter::Search.new
search.containing("#津山弥生祭").language("ja").result_type("recent").each do |r|
  #puts r
  p r.id
  db = SQLite3::Database.new("../db/development.sqlite3")
  hoge = db.execute('select * from cards where tweet_id = ?', r.id)
  db.close
  p hoge
  if hoge.empty?
    p 'haittenai'
    insdb = SQLite3::Database.new("../db/development.sqlite3")
    new_item = {:message => r.text, :tweet_id => r.id}
    sql = "insert into cards values (:id, :message, :tweet_id, :created_at, :updated_at)"
    insdb.execute(sql, new_item)
    insdb.close
  end
end


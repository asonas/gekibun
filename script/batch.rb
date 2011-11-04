# -*- coding: utf-8 -*-
require 'twitter'
search = Twitter::Search.new

search.containing("#津山弥生祭").language("ja").result_type("recent").per_page(5).each do |r|
puts r
  p "#{r.from_user}:#{r.text}"
end
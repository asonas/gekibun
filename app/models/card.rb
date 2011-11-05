class Card < ActiveRecord::Base
  scope :find_by_big_id,
    lambda {|id|
      where "id > ?", id
    }
end

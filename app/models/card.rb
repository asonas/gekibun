class Card < ActiveRecord::Base
  scope :find_by_big_id,
    lambda {|id|
      where "id > ?", id
    }
  validates :message, :presence => true,  
  :length => {:minimum => 2}  
end

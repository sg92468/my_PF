class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :conpany
  belongs_to :room
  
end

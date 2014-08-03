class Comp < ActiveRecord::Base
  belongs_to :location
  belongs_to :classification
end


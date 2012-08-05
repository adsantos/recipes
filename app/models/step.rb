class Step < ActiveRecord::Base
  attr_accessible :description
  belongs_to :recipe
end

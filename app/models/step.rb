class Step < ActiveRecord::Base
  attr_accessible :description
  validates_presence_of :description

  belongs_to :recipe
end

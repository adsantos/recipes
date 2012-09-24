class Step < ActiveRecord::Base
  attr_accessible :description
  validates_presence_of :description

  belongs_to :recipe

  def self.create_from_params(desc_list)
    desc_list.map{|desc| Step.create(description: desc)} if desc_list
  end

end

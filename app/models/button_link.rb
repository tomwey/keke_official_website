class ButtonLink < ActiveRecord::Base
  attr_accessible :link, :newsblast_id, :title
  
  belongs_to :newsblast
end

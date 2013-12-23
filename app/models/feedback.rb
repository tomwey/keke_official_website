class Feedback < ActiveRecord::Base
  attr_accessible :author, :content
  
  validates_presence_of :content
  
end

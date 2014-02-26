class Question < ActiveRecord::Base
  attr_accessible :reply, :title
  
  validates_presence_of :reply, :title
end

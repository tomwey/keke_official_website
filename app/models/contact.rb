class Contact < ActiveRecord::Base
  attr_accessible :content, :email, :name
  
  validates_presence_of :content
end

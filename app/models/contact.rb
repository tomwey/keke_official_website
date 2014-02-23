class Contact < ActiveRecord::Base
  attr_accessible :content, :email, :name
end

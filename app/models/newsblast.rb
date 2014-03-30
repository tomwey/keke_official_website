class Newsblast < ActiveRecord::Base
  attr_accessible :content, :link, :title, :app_ids
  
  validates_presence_of :title, :content
  
  has_and_belongs_to_many :apps
  
  def as_json(options)
    {
      title: self.title,
      content: self.content,
      link:  self.link ||= ""
    }
  end
  
end

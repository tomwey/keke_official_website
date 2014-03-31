class Newsblast < ActiveRecord::Base
  attr_accessible :content, :link, :title, :app_ids, :news_type
  
  validates_presence_of :title, :content, :news_type
  
  has_and_belongs_to_many :apps
  
  NEWS_TYPES = [['Alert', 1], ['Modal-plain', 2], ['Modal-html', 3]]
  
  def as_json(options)
    {
      title: self.title,
      content: self.content,
      type: self.news_type,
      link:  self.link ||= ""
    }
  end
  
end

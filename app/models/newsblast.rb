# coding: utf-8
class Newsblast < ActiveRecord::Base
  attr_accessible :content, :url, :title, :app_ids, :news_type, :button_links_attributes, :show_times, :utype
  
  validates_presence_of :news_type, :utype
  
  has_and_belongs_to_many :apps
  
  has_many :button_links, :dependent => :destroy
  accepts_nested_attributes_for :button_links, :reject_if => :check_title_and_content, :allow_destroy => true
  
  NEWS_TYPES = [['Alert', 1], ['Modal-plain', 2], ['Modal-html', 3]]
  
  UTYPE = [['非注册用户', 1], ['注册用户', 2], ['不限', 3]]
  
  def check_title_and_content
    new_record? and self[:title].blank?
  end
  
end

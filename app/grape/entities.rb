# coding: utf-8
module KeKe
  module APIEntities
    class NewsblastDetail < Grape::Entity
      expose :id
      expose :news_type, as: :type 
      expose :show_times, type: String
      expose :title, :content, if: lambda { |newsblast, options| newsblast.news_type != 3 }
      expose :url, if: lambda { |newsblast, options| newsblast.news_type == 3 }
      expose :links, if: lambda { |newsblast, options| newsblast.news_type != 3  } do |newsblast, options|
        newsblast.button_links.select('title, link').each do
          expose :title, :link
        end
      end
    end
    
    class ButtonLink < Grape::Entity
      expose :title 
      expose :link
    end
    
  end
end
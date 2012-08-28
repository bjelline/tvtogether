require 'httparty'

class Tvrage
  include HTTParty
  base_uri 'services.tvrage.com'
  format :xml

  def self.find_by_title(  title )
    h = get('/feeds/search.php?show=' + CGI.escape( title ));
    h = h["Results"]["show"]

    unless Array === h
      h = [ h ]
    end 

    h

  end

  def self.episodes( showid )
    h = get('/feeds/episode_list.php?sid=' + showid.to_s );

    arr = []

    return [] if h["Show"].nil?
    return [] if h["Show"]["Episodelist"].nil?
    return [] unless Array === h["Show"]["Episodelist"]["Season"]

    h["Show"]["Episodelist"]["Season"].each do |season|
      unless season["episode"].nil?
        if  Array === season["episode"] 
          season["episode"].each do |episode|
            e = episode.clone
            e["epnum"] = e["epnum"].to_i
            e["seasonnum"] = season["no"].to_i
            arr.push( e )
          end
        end
      end
    end

    arr
  end
end

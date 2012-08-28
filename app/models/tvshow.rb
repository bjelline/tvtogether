class Tvshow < ActiveRecord::Base
  has_many :episodes
  attr_accessible :imdb_url, :title
end

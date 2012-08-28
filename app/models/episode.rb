class Episode < ActiveRecord::Base
  belongs_to :tvshow
  attr_accessible :season, :no, :title


end

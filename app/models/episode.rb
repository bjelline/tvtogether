class Episode < ActiveRecord::Base
  belongs_to :tvshow
  attr_accessible :epnum, :seasonnum, :title, :prodnum, :airdate, :link

  validates :epnum, :uniqueness => { :scope => :tvshow_id, :message => "Episoden-Nr. sind eindeutig innerhalb der Serie." }
end

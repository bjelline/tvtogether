# encoding: utf-8

class Tvshow < ActiveRecord::Base

  has_many :episodes, :dependent => :destroy
  attr_accessible :showid, :name, :link, :prodnum, :seasons, :country, :started, :ended, :status, :classification
  accepts_nested_attributes_for :episodes

  validates :showid,  :uniqueness => {  :message => "Diese Serie ist bereits vorhanden" } 
  validates :link,    :format => { :with => /^http:..www.tvrage.com./, :message => "Link zu TVRage muss bleiben" }
  validates :country, :format => { :with => /^\w\w$/,  :message => "Zwei-Buchtstaben Code für das Land" }
  validates :started, :format => { :with => /^\d{4}$/, :message => "Jahrezahl mit 4 Ziffern - oder leer" }, :allow_blank => true
  validates :ended,   :format => { :with => /^\d{4}$/, :message => "Jahrezahl mit 4 Ziffern - oder leer" }, :allow_blank => true


  protected

end

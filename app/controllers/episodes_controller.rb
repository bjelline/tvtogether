class EpisodesController < ApplicationController
  before_filter :get_tvshow

  def index
    @episodes = @tvshow.episodes
  end


private 
  def get_tvshow
    @tvshow = Tvshow.find(params[:tvshow_id])
    raise "Show not found" if @tvshow.nil?
  end
end

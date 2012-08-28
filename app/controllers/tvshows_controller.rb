class TvshowsController < ApplicationController
  def index
    @tvshows = Tvshow.all
  end

  # GET /tvshows/new                 - ohne parameter 'title' - ist das nomale formular
  # GET /tvshows/new?title=Sherlock  - nur ein suchfeld: sucht erst bei tvrage und erzeugt dann
  #                                    das normale formular
  def new
    @tvshow = Tvshow.new

    unless params[:title].blank?
      tvrage = Tvrage.find_by_title( params[:title] )
      gon.shows = tvrage.index_by{|s| s["showid"] }
    end

    if tvrage.nil? 
      render "new"
    else 
      @tvrage_options = tvrage.map{|s|[s["name"],s["showid"]]}
      render "new_with_data"
    end
  end

  # POST /tvshows
  def create
    @tvshow = Tvshow.new(params[:tvshow])

    unless @tvshow.save
      render "new_with_data"
      return
    end

    Tvrage.episodes( @tvshow.showid ).each do |ep|
      Rails.logger.warn("Episoden-Daten: #{ep}")
      @tvshow.episodes.create( ep )
    end

    redirect_to tvshow_episodes_path(@tvshow), notice: 'Serie wurde erfolgreich gespeichert'
  end

  # DELETE /tvshows/1
  def destroy
    @tvshow = Tvshow.find(params[:id])
    @tvshow.destroy

    redirect_to tvshows_url
  end
end

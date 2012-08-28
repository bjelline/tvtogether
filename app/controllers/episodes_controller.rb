class EpisodesController < ApplicationController
  before_filter :get_tvshow

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = @tvshow.episodes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @episodes }
    end
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episode = Episode.find(params[:id])
    raise "URL ist verwirrt!" unless @episode.tvshow == @tvshow

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @episode }
    end
  end

  # GET /episodes/new
  # GET /episodes/new.json
  def new
    @episode = @tvshow.episodes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @episode }
    end
  end

  # GET /episodes/1/edit
  def edit
    @episode = Episode.find(params[:id])
    raise "URL ist verwirrt!" unless @episode.tvshow == @tvshow
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = @tvshow.episodes.build(params[:episode])

    respond_to do |format|
      if @episode.save
        format.html { redirect_to tvshow_episodes_path(@tvshow), notice: 'Episode was successfully created.' }
        format.json { render json: @episode, status: :created, location: tvshow_episodes_path(@tvshow) }
      else
        format.html { render action: "new" }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /episodes/1
  # PUT /episodes/1.json
  def update
    @episode = Episode.find(params[:id])

    respond_to do |format|
      if @episode.update_attributes(params[:episode])
        format.html { redirect_to @episode, notice: 'Episode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy

    respond_to do |format|
      format.html { redirect_to episodes_url }
      format.json { head :no_content }
    end
  end

private 
  def get_tvshow
    @tvshow = Tvshow.find(params[:tvshow_id])
    raise "Show not found" if @tvshow.nil?
  end
end

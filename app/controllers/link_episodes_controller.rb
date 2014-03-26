class LinkEpisodesController < ApplicationController

	before_action :get_series
	before_action :set_link, only: [:show, :edit, :update, :destroy]

	def get_series
    	@parent = Episode.find(params[:episode_id]) if params[:episode_id] 
  	end

	def index
		@links=@parent.link_episode
	end

	def new
		@link = LinkEpisode.new
	end

	def create
		if @parent
	      @link = @parent.link_episodes.new(link_episode_params)
	    else
	      @link = LinkEpisode.new(link_episode_params)
	    end
	    @link.episode=@parent
	    @link.user=current_user
	    respond_to do |format|
	      if @link.save
	        format.html { redirect_to @parent, notice: 'Link was successfully created.' }
	        format.json { render action: 'show', status: :created, location: @link }
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @link.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def destroy
   		@link.destroy
	    respond_to do |format|
	      format.html { redirect_to polymorphic_url(@parent) }
	      format.json { head :no_content }
    	end
    end 

	private

	def link_episode_params
      params.require(:link_episode).permit(:link_text, :episode_id)
    end

    def set_link
    	@link = LinkEpisode.find(params[:id])
    end
end

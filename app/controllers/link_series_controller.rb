class LinkSeriesController < ApplicationController

	before_action :get_series
	before_action :set_link, only: [:show, :edit, :update, :destroy]

	def get_series
    	@parent = Series.find(params[:series_id]) if params[:series_id] 
  	end

	def index
		@links=@parent.link_series
	end

	def new
		@link = LinkSeries.new
	end

	def create
		if @parent
	      @link = @parent.link_series.new(link_series_params)
	    else
	      @link = LinkSeries.new(link_series_params)
	    end
	    @link.series=@parent
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

	def link_series_params
      params.require(:link_series).permit(:link_text, :shows_id)
    end

    def set_link
    	@link = LinkShow.find(params[:id])
    end
end

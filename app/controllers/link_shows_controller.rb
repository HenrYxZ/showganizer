class LinkShowsController < ApplicationController

	before_action :get_show
	before_action :set_link, only: [:show, :edit, :update, :destroy]

	def get_show
    	@parent = Show.find(params[:show_id]) if params[:show_id] 
  	end

	def index
		@links=@parent.link_shows
	end

	def new
		@link = LinkShow.new
	end

	def create
		if @parent
	      @link = @parent.link_shows.new(link_show_params)
	    else
	      @link = LinkShow.new(link_show_params)
	    end
	    @link.show=@parent
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

	def link_show_params
      params.require(:link_show).permit(:link_text, :show_id)
    end

    def set_link
    	@link = LinkShow.find(params[:id])
    end
end

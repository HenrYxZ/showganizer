class SeenController < ApplicationController
  
  def shows
    @seens = current_user.shows
  end

  def movies
    @seens = current_user.movies
  end

  def series
    @seens = current_user.series
  end

  def seasons
    @seens = current_user.seasons
  end

  def episodes
    @seens = current_user.episodes
  end

end

class WatchlistController < ApplicationController

  def index
  end

  def shows
    @shows = Show.joins(:watchlist_shows).where(watchlist_shows: {user: current_user}).uniq
  end

  def movies
    @movies = Movie.joins(:watchlist_movies).where(watchlist_movies: {user: current_user}).uniq
  end

  def series
    @series = Series.joins(:watchlist_series).where(watchlist_series: {user: current_user}).uniq
  end

  def seasons
    @seasons = Season.joins(:watchlist_seasons).where(watchlist_seasons: {user: current_user}).uniq
  end

  def episodes
    @episodes = Episode.joins(:watchlist_episodes).where(watchlist_episodes: {user: current_user}).uniq
  end
end

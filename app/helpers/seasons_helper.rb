module SeasonsHelper

	def add_season_to_watchlist(season)
		WatchlistSeason.create(user: current_user, season: season)

		# agregar cada episodio que falta de esa temporada
    	season.episodes.each do |episode|
      		WatchlistEpisode.create(user: current_user, episode: episode)
    	end
	end

	def remove_season_from_watchlist(season)
		encontrado = WatchlistSeason.find_by(user:current_user, season: season)
    	encontrado.destroy if encontrado

    	# eliminar cada episodio en la temporada
    	season.episodes.each do |episode|
    		encontrado = WatchlistEpisode.find_by(user:current_user, episode: episode)
    		encontrado.destroy if encontrado
    	end
	end
end

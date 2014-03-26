module SeriesHelper

	def add_series_to_watchlist(series)
		WatchlistSeries.create(user: current_user, series: series)

		# agregar cada temporada que falta de esa serie
		series.seasons.each do |season|
			add_season_to_watchlist(season)
		end
	end

	def remove_series_from_watchlist(series)
		encontrado = WatchlistSeries.find_by(user:current_user, series: series)
    	encontrado.destroy if encontrado

		# eliminar cada temporada de esa serie
		series.seasons.each do |season|
			remove_season_from_watchlist(season)
		end    	
	end

end

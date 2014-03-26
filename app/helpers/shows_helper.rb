module ShowsHelper

	def add_show_to_watchlist(show)
		WatchlistShow.create(user: current_user, show: show)

		# agregar cada pelicula asociada
		show.movies.each do |movie|
			WatchlistMovie.create(user: current_user, movie: movie)
		end

		# agregar cada serie asociada
		show.series.each do |series|
			add_series_to_watchlist(series)
		end
	end

	def remove_show_from_watchlist(show)
		encontrado = WatchlistShow.find_by(user:current_user, show: @show)
		encontrado.destroy if encontrado

		# eliminar cada pelicula asociada
		show.movies.each do |movie|
			WatchlistMovie.find_by(user: current_user, movie: movie).destroy
		end

		# eliminar cada serie asociada
		show.series.each do |series|
			remove_series_from_watchlist(series)
		end
	end
end

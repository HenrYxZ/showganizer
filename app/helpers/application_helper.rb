module ApplicationHelper
	def get_all_categories
		['Family', 'Horror', 'Action', 'Romantic', 'Thriller',
    	'Anime', 'Documentaries', 'Dramas', 'Comedies', 'Sci-fi and Fantasy']
	end
	def url_with_protocol(url)
    	/^http/.match(url) ? url : "http://#{url}"
  	end
  	def youtube_embed(youtube_url)
	  if youtube_url[/youtu\.be\/([^\?]*)/]
	    youtube_id = $1
	  else
	    # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
	    youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
	    youtube_id = $5
	  end
	  %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}.html_safe
	end
end

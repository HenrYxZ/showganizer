module UsersHelper
	def show_list(shows)
		shows=shows.uniq
		shows.map {|s| link_to(s.name, show_path(s))}.join(', ').html_safe
	end
	#api for obtanin image from gravatar
	def avatar_url(user)
		if user.avatar.present?
			user.avatar
		else
			default_url= "http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;f=y"
			gravatar_id=Digest::MD5.hexdigest(user.email.downcase)
			"http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
		end
	end
end

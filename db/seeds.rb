# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# => Shows
Show.create(name:'The walking dead', start_date: "2010-09-11", end_date: nil,
 	description: "It's about a zombie apocalypse", category: "Horror")

Show.create(name: 'LOST', start_date: "2004-09-22", end_date: "2010-5-23",
	description: "People get lost in a Island", category: "Action")

Show.create(name: 'The Lord of the Rings', start_date: "2001-12-10", end_date: nil,
	description: "Fantasy world in the Middle-Earth", category: "Sci-fi and Fantasy")

Show.create(name: 'Batman', start_date: "1966-1-12", end_date: nil,
	description: "A superhero saving a modern city full of darkness", category: "Action")

# =>  Movies
Movie.create(name: 'The Fellowship of the Ring', release_date: "2001-12-10", 
	description: "Beginning of the adventure when Frodo finds the ring and starts the 
	journey to Mordor for burning the ring", number: 1, category: "Sci-fi and Fantasy", show_id: 3)

Movie.create(name: 'LOST The Movie', release_date: "2008-2-23", 
	description: "Jack turns into a werewolf by the experiments of Dharma",
	number: 1, category: "Action", show_id: 2)

Movie.create(name: 'Batman Begins', release_date: "2005-6-16",
	description: "After training with his mentor, Batman begins his war on crime
	to free the crime-ridden Gotham City from corruption that the Scarecrow and
	the League of Shadows have cast upon it", number: 1, category: "Action", show_id: 4)

# => Series
Series.create(name: 'LOST', start_date: "2004-9-22", end_date: "2010-5-23",
	description: "A plane crushes in a lost Island, the survivors try to find a way out",
	number: 1, category: "Action", show_id: 2)

Series.create(name: 'The Walking Dead', start_date: "2010-9-11", end_date: nil,
	description: "The city of Atlanta is invaded by a letal virus that turns people into zombies,
	while a group of people tries to survive and live a normal life again",
	number: 1, category: "Action", show_id: 1)

Series.create(name: 'Batman Beyond', start_date: "1999-1-10", end_date: "2001-12-18",
	description: "Fueled by remorse and vengeance, a high schooler named Terry 
	McGinnis revives the role of Batman. Under supervision of an elderly Bruce Wayne,
	he fights crime in a harsh futuristic Gotham.",
	number: 4, category: "Action", show_id: 4)

# => Seasons
Season.create(name: 'Season 1', start_date: "2004-9-22", end_date: "2005-5-25",
	number: 1, series_id: 1)

# => Episode
Episode.create(name: 'Pilot: Part 1', release_date: "2004-9-22", number: 1, season_id: 1)


# =>  Users
User.create(name:'admin',email:'admin@showganizer.com',password:'hola',type_of_user: 'admin')
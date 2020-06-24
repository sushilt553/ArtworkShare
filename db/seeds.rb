# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(username: "sushil")
user2 = User.create(username: "alina")

artwork1 = Artwork.create(title: "harrypotter", image_url: "harrypotter.com", artist_id: user1.id)
artwork2 = Artwork.create(title: "lordoftherings", image_url: "lordoftherings.com", artist_id: user2.id)

ArtworkShare.create(viewer_id: user2.id, artwork_id: artwork1.id)
ArtworkShare.create(viewer_id: user1.id, artwork_id: artwork2.id)
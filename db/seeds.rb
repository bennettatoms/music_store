# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
albums = Album.create([{ name: 'OK Computer', artist: 'Radiohead', genre: 'Rock', price: 12.99 }, 
                       { name: 'Mysterious Production of Eggs', artist: 'Andrew Bird', genre: 'Chamber Pop', price: 11.99 }, 
                       { name: 'Turn On the Bright Lights', artist: 'Interpol', genre: 'Indie Rock', price: 9.99 }])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "raj", password: 'raj', role: "admin")

Genre.create(name: "Horror")
Genre.create(name: "Drama")
Genre.create(name: "Okay")

m = Movie.create(name: "Whatever", year: "1234", genres: Genre.all)
Movie.create(name: "Inception", year: "1234", genres: [Genre.first])
Movie.create(name: "Blah", year: "1234")


User.create(username: "Riya", role: "user", movies: [Movie.first, Movie.last])
User.create(username: "Sumit", role: "user", movies: [Movie.first])
User.create(username: "test", role: "user")

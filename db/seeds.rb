# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "admin", password: 'password', role: "admin")

Genre.create(name: "Horror")
Genre.create(name: "Drama")
Genre.create(name: "Comedy")

m = Movie.create(name: "Batman", year: "2001", genres: Genre.all, main_star: 'Christian Bale')
Movie.create(name: "Inception", year: "2010", genres: [Genre.first], director: "C Nolan")
Movie.create(name: "D&D", year: "1990", genres: [Genre.first])

User.create(username: "Riya", role: "user", movies: [Movie.first, Movie.last])
User.create(username: "Sumit", role: "user", movies: [Movie.first])
User.create(username: "test", role: "user")

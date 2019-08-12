json.movie do
  json.id :id
  json.name :name
  json.year :year
  json.director :director
  json.main_star :main_star
  json.description :description
  json.genres movie.genres.pluck :name
  json.favorite_usernames movie.users.pluck :username
end

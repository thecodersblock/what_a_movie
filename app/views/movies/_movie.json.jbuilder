json.movie do
  json.id :id
  json.name :name
  json.year :year
  json.director :director
  json.main_star :main_star
  json.description :description
  json.genres movie.genres.pluck :name
  json.favorite_usernames_count movie.users.length
  json.favorite_usernames movie.users.pluck :username
  json.thumbnail request.host_with_port+url_for(movie.thumbnail) if movie.thumbnail.attached?
end

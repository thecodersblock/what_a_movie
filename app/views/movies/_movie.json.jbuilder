json.movie do
  json.id movie.id
  json.name movie.name
  json.year movie.year
  json.director movie.director
  json.main_star movie.main_star
  json.description movie.description
  json.genres movie.genres.pluck :name
  json.favorite_usernames_count movie.users.length
  json.favorite_usernames movie.users.pluck :username
  json.thumbnail request.host_with_port+url_for(movie.thumbnail) if movie.thumbnail.attached?
end

json.extract! user, :id, :username
json.token token if token
json.url user_url(user, format: :json)

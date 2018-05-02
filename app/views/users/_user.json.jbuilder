json.extract! user, :id, :netid, :email, :created_at, :updated_at
json.url user_url(user, format: :json)

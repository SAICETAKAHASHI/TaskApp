json.extract! user, :id, :user_name, :user_password, :control_level, :created_at, :updated_at
json.url user_url(user, format: :json)

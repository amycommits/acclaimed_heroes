json.extract! badge, :id, :remote_id, :badge_url, :image_url, :skill, :created_at, :updated_at
json.url badge_url(badge, format: :json)

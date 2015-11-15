json.array!(@post) do |post|
  json.extract! post, :id, :user, :message
  json.url post_url(post, format: :json)
end

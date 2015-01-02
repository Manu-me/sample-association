json.array!(@candies) do |candy|
  json.extract! candy, :id, :name, :kid_id
  json.url candy_url(candy, format: :json)
end

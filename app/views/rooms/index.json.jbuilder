json.array!(@rooms) do |room|
  json.extract! room, :id, :title, :location, :description, :text
  json.url room_url(room, format: :json)
end

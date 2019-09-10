if item
  json.id item.id
  json.name item.name
  json.photo image_url(item.photo)
  json.price item.price
else
  json.null!
end

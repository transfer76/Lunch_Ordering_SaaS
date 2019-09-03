module ApplicationHelper
  def item_photo(item)
    if item.photo?
      item.photo.url
    else
      asset_path('food.jpg')
    end
  end
end

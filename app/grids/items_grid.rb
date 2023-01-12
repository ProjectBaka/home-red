class ItemsGrid < BaseGrid

  scope do
    Item.includes(:brand, :location)
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)

  column(:id)
  column(:name)
  column(:valid_to)
  column(:brand) do |item|
    item.brand.name
  end
  column(:location) do |item|
    item.location.name
  end

  date_column(:created_at)
end

class ItemsGrid < BaseGrid

  scope do
    Item
  end
  filter(:barcode, :string)

  column(:id)
  column(:name)
  column(:brand) do |item|
    item.brand.name
  end
  column(:valid_to)
  column(:location) do |item|
    item.location.name
  end
  column(:barcode)

  column(:actions, :html => true) do |item|
    puts item.name
    render "items/actions", item: item
  end
end

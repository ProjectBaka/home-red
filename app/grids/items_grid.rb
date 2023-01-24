class ItemsGrid < BaseGrid

  scope do
    Item
  end
  filter(:barcode, :string)

  column(:id)
  column(:name)
  date_column(:created_at)
  column(:actions, :html => true) do |item|
    puts item.name
    render "items/actions", item: item
  end
end

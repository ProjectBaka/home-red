class LocationsGrid < BaseGrid

  scope do
    Location
  end

  filter(:name, :string)

  column(:id)
  column(:name)
  column(:notes)
  date_column(:created_at)
end

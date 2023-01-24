class BrandsGrid < BaseGrid

  scope do
    Brand
  end

  filter(:name, :string)

  column(:id)
  column(:name)
  column(:notes)
  date_column(:created_at)
end

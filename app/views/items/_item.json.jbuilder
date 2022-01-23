json.extract! item, :id, :name, :notes, :barcode, :valid_to, :created_at, :updated_at
json.url item_url(item, format: :json)

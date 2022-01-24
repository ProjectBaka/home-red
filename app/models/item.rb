class Item < ApplicationRecord
  belongs_to :location
  belongs_to :brand

  after_create_commit { broadcast_append_to 'item' }
  after_update_commit { broadcast_replace_to 'item' }
  after_destroy_commit { broadcast_remove_to 'item' }
end

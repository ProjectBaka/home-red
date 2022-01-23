class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :notes
      t.string :barcode
      t.datetime :valid_to

      t.timestamps
    end
  end
end

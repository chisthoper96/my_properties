class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :operation
      t.integer :property_type
      t.float :price
      t.integer :currency_type
      t.string :commune
      t.string :address
      t.integer :area
      t.integer :bedrooms
      t.integer :bathrooms
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

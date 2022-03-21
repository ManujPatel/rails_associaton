class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :house_number
      t.string :street_name
      t.string :road
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

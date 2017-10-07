class CreateV1Beers < ActiveRecord::Migration[5.1]
  def change
    create_table :v1_beers do |t|
      t.string :name
      t.string :brand
      t.float :price
      t.string :store

      t.timestamps
    end
  end
end

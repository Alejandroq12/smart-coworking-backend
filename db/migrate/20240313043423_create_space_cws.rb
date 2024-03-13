class CreateSpaceCws < ActiveRecord::Migration[7.1]
  def change
    create_table :space_cws do |t|
      t.string :name
      t.string :model
      t.text :description
      t.string :address
      t.decimal :price
      t.string :image
      t.decimal :discount
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

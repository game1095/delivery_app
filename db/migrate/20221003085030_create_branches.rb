class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name

      t.string :north
      t.string :south
      t.string :west
      t.string :east

      t.text :important_place
      t.text :important_road
      t.text :geography

      t.references :branch_type , foreign_key: true
      t.references :post_office , foreign_key: true

      t.timestamps
    end
  end
end

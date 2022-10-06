class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.string :delivery_point
      t.string :section

      t.string :house_number
      t.string :moo
      t.string :village
      t.string :road
      t.string :sub_district
      t.string :district
      t.string :province
      t.string :landmark


      t.references :branch , foreign_key: true

      t.timestamps
    end
  end
end

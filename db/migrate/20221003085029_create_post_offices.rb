class CreatePostOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :post_offices do |t|
      t.string :name
      t.string :post_code

      t.timestamps
    end
  end
end

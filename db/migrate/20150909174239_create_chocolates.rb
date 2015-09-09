class CreateChocolates < ActiveRecord::Migration
  def change
    create_table :chocolates do |t|
      t.string :name
      t.string :photo_url
      t.string :manufacturer
      t.string :ingredients

      t.timestamps
    end
  end
end
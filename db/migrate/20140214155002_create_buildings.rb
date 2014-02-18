class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.integer :year_built
      t.string :photo_url
      t.float :latitude
      t.float :longitude
      t.references :architect
    end
  end
end

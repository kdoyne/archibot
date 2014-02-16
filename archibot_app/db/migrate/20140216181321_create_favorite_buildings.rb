class CreateFavoriteBuildings < ActiveRecord::Migration
  def change
    create_table :favorite_buildings do |t|
      t.belongs_to :user
      t.belongs_to :building
    end
  end
end

class CreateBuildingsTrips < ActiveRecord::Migration
  def change
    create_table :buildings_trips do |t|
      t.references :building
      t.references :trip
    end
  end
end

class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.text :title
      t.text :location
      t.references :user
    end
  end
end

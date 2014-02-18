class CreateBuildingsUsers < ActiveRecord::Migration
  def change
    create_table :buildings_users do |t|
      t.references :user
      t.references :building
    end
  end
end

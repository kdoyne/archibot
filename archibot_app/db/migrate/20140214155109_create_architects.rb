class CreateArchitects < ActiveRecord::Migration
  def change
    create_table :architects do |t|
      t.string :name
      t.integer :year_born
      t.integer :year_died
      t.string :style
    end
  end
end

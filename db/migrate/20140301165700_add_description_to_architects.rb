class AddDescriptionToArchitects < ActiveRecord::Migration
  def change
    add_column :architects, :description, :text
  end
end

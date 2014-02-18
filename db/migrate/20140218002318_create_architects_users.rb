class CreateArchitectsUsers < ActiveRecord::Migration
  def change
    create_table :architects_users do |t|
      t.references :user
      t.references :architect
    end
  end
end

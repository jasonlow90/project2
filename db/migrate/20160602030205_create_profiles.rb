class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :countries_visited
      t.string :favourite_countries
      t.string :bucket_list
      t.boolean :travel_buddy
      t.references :user
      t.timestamps null: false
    end
  end
end

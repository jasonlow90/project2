class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :country
      t.references :user, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end

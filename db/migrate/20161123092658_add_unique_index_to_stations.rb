class AddUniqueIndexToStations < ActiveRecord::Migration[5.0]
  def change
  	add_index :stations, [:latitude, :longitude], unique: true
  end
end

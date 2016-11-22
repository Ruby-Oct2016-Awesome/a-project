class AddBicyclesToStations < ActiveRecord::Migration[5.0]
  def change
    add_reference :stations, :bicycle, foreign_key: true
  end
end

class RemoveBicyclesRefFromStations < ActiveRecord::Migration[5.0]
  def change
    remove_reference :stations, :bicycle, foreign_key: true
  end
end

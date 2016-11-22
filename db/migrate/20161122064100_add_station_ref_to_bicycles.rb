class AddStationRefToBicycles < ActiveRecord::Migration[5.0]
  def change
    add_reference :bicycles, :station, foreign_key: true
  end
end

class AddLocationLatLngToApartments < ActiveRecord::Migration

  def up
    add_column :apartments, :location, :string
    add_column :apartments, :lat, :float
    add_column :apartments, :lng, :float
  end

  def down
    remove_column :apartments, :location
    remove_column :apartments, :lat
    remove_column :apartments, :lng
  end

end

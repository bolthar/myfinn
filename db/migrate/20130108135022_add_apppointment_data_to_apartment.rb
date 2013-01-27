class AddApppointmentDataToApartment < ActiveRecord::Migration

  def up
    add_column :apartments, :contacted, :bool, :default => false
    add_column :apartments, :rejected, :bool, :default => false
  end

  def down
    remove_column :apartments, :contacted
    remove_column :apartments, :rejected
  end

end

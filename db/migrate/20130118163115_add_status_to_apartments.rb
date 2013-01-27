class AddStatusToApartments < ActiveRecord::Migration

  def up
    add_column :apartments, :status, :integer, :default => 0
  end

  def down
    remove_column :apartments, :status
  end

end

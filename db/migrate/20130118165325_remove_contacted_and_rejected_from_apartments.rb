class RemoveContactedAndRejectedFromApartments < ActiveRecord::Migration

  def up
    remove_column :apartments, :contacted
    remove_column :apartments, :rejected
  end

  def down
    add_column :apartments, :contacted, :boolean
    add_column :apartments, :rejected, :boolean
  end

end

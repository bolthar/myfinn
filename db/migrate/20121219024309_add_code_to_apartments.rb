class AddCodeToApartments < ActiveRecord::Migration

  def up
    add_column :apartments, :code, :integer
  end

  def down
    drop_column :apartments, :code
  end

end

class AddUserToApartments < ActiveRecord::Migration

  def up
    add_column :apartments, :user_id, :integer
  end

  def down
    remove_column :apartments, :user_id
  end

end

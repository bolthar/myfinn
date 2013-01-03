class AddRatingToApartments < ActiveRecord::Migration

  def up
    add_column :apartments, :rating, :integer, :default => 0
  end

  def down
    remove_column :apartments, :rating
  end

end

class AddScoreToApartments < ActiveRecord::Migration

  def up
    add_column :apartments, :score, :integer
  end

  def down
    remove_column :apartments, :score
  end

end

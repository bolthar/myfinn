class AddTimestampsToApartments < ActiveRecord::Migration

  def up
    change_table :apartments do |t|
      t.timestamps
    end
  end

end

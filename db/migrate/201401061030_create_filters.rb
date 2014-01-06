class CreateFilters < ActiveRecord::Migration

  def up
    create_table :filters do |t|
      t.string :url
      t.timestamps
    end
  end

  def down
    drop_table :filters
  end

end

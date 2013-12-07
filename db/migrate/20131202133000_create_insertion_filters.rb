class CreateInsertionFilters < ActiveRecord::Migration

  def up
    create_table :insertion_filters do |t|
      t.string :description
      t.string :query
      t.boolean :notify, :default => false
    end
  end

  def down
    drop_table :insertion_filters
  end

end

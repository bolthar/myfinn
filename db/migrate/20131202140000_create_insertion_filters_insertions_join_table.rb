
class CreateInsertionFiltersInsertionsJoinTable < ActiveRecord::Migration
  
  def up
    create_table :insertion_filters_insertions, :id => false do |t|
      t.references :insertion_filter
      t.references :insertion
    end
  end

  def down
    drop_table :insertion_filters_insertions
  end

end

class CreateFeatures < ActiveRecord::Migration

  def up
    create_table :features do |t|
      t.string :description
    end
  end

  def down
    drop_table :features
  end

end

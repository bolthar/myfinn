class CreateApartmentsFeaturesJoinTable < ActiveRecord::Migration
  
  def up
    create_table :apartments_features, :id => false do |t|
      t.references :apartment
      t.references :feature
    end
  end

  def down
    drop_table :apartments_features
  end

end

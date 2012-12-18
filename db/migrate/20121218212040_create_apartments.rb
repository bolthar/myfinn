class CreateApartments < ActiveRecord::Migration

  def up
    create_table :apartments do |t|
      t.string :title
      t.integer :rent
      t.integer :deposit
      t.string :size
      t.integer :floor
      t.datetime :start_date
      t.datetime :end_date
      t.text :html_description
    end
  end

  def down
    drop_table :apartments
  end

end

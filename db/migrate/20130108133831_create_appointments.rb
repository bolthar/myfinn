class CreateAppointments < ActiveRecord::Migration

  def up
    create_table :appointments do |t|
      t.references :apartment
      t.datetime :datetime
      t.string :reference_person
      t.text :notes
    end
  end

  def down
    drop_table :appointments
  end

end

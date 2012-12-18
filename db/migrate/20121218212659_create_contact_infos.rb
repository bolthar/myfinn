class CreateContactInfos < ActiveRecord::Migration

  def up
    create_table :contact_infos do |t|
      t.references :apartment
      t.string :type
      t.string :value
    end
  end

  def down
    drop_table :contact_infos
  end

end

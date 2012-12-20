class CreateComments < ActiveRecord::Migration

  def up
    create_table :comments do |t|
      t.references :apartment
      t.references :user
      t.text :text
      t.timestamps
    end
  end

  def down
    drop_table :comments
  end

end

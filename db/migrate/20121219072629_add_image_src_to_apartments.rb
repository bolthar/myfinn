class AddImageSrcToApartments < ActiveRecord::Migration
  
  def up
    add_column :apartments, :image_src, :string
  end

  def down
    remove_column :apartments, :image_src
  end

end

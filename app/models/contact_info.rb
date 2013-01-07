
class ContactInfo < ActiveRecord::Base

  belongs_to :apartment
  set_inheritance_column :none

end

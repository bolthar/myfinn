
class Apartment < ActiveRecord::Base
 
  has_many :contact_infos
  has_and_belongs_to_many :features

end

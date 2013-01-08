
class Apartment < ActiveRecord::Base
 
  has_many :contact_infos
  has_and_belongs_to_many :features
  has_many :comments

  belongs_to :user

  def finn_link
    return "#{Parser.base_path}#{self.code}"
  end

  def location=(value)
    write_attribute(:location, value)
    position = Geocoder.coordinates(value)
    self.lat = position[0].to_d
    self.lng = position[1].to_d
  end

end

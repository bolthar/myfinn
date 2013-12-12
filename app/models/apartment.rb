
#encoding: UTF-8

class Apartment < ActiveRecord::Base
 
  has_many :contact_infos
  has_and_belongs_to_many :features
  has_many :comments

  belongs_to :user
  has_one :appointment

  def finn_link
    return "#{Parser.base_path}#{self.code}"
  end

  def location=(value)
    value_utf = value.encode("UTF-8")
    write_attribute(:location, value_utf)
    position = Geocoder.coordinates(value_utf)
    self.lat = position[0].to_d
    self.lng = position[1].to_d
  end

  def seasons
    return Season.all(self)
  end

end

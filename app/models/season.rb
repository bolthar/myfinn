
class Season

  SUNCALC_BASE_URL = "http://suncalc.net/#/"
  attr_reader :name

  def initialize(apartment, name, date)
    @apartment = apartment
    @name = name
    @date = date
  end

  def suncalc_href
    return "#{SUNCALC_BASE_URL}#{@apartment.lat},#{@apartment.lng},12/#{@date.strftime("%Y.%m.%d")}/12:00"
  end
  
  def self.all(apartment)
    return [
      Season.new(apartment, "Spring", Time.new(2014, 3, 15)),
      Season.new(apartment, "Summer", Time.new(2014, 6, 15)),
      Season.new(apartment, "Autumn", Time.new(2014, 9, 15)),
      Season.new(apartment, "Winter", Time.new(2014, 12, 15))
    ]
  end

end

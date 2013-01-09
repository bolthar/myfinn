
class Appointment < ActiveRecord::Base

  belongs_to :apartment

  def date
    return "" unless self.datetime
    return self.datetime.strftime("%d/%m/%Y")
  end

  def time
    return "" unless self.datetime
    return self.datetime.strftime("%H:%M")
  end

end

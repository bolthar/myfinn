
class Appointment < ActiveRecord::Base

  belongs_to :apartment

  def date
    self.datetime.strftime("%d/%m/%Y")
  end

  def time
    self.datetime.strftime("%H:%M")
  end

end

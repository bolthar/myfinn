
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

  def to_calendar_event
    return { 
      :id => self.apartment.id, 
      :title => self.apartment.title, 
      :start => "#{self.datetime.strftime("%Y/%m/%d")} #{self.time}", 
      :allDay => false
    }
  end

  def self.valid
    self
      .where("datetime is not null AND apartment_id is not null")
      .select { |x| x.apartment && x.apartment.status == 3 } #ugly...
  end

end

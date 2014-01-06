
class Filter < ActiveRecord::Base

  def self.default
    filter = self.first
    return filter.url if filter
    return Rails.application.config.insertion_filter_url
  end

end

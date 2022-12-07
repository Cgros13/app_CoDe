module ApplicationHelper
  def green_data(visits)
    count = visits.compact.count do |visit|
      visit.green
    end
    (count.to_f / visits.count.to_f).round(2) * 100
  end
end

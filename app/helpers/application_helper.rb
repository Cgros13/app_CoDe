module ApplicationHelper
  def green_data(visits)
    count = visits.compact.count(&:green)
    green = (count.to_f / visits.count) * 100
    green.round(2)
  end

  def bytes_data(visits)
    visits.where.not(bytes: nil).map(&:bytes).sum.round(2)
  end
end

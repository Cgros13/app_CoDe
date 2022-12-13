class PagesController < ApplicationController
  def home
    @visits = current_user.visits.order(created_at: :asc)
    filter_by_period
    groups = @visits.where.not(statistics: nil, url: nil).group_by { |visit| visit.url }

    @data = groups.map(&:last).map do |visits|
      {
        url: visits.map(&:url).uniq,
        co2: visits.map(&:co2_by_time).sum.round(2) / 4
      }
    end
    @data = @data.sort_by { |visit| visit[:co2] }.reverse.first(10)
  end

  def filter_by_period
    return unless params[:period].present?

    period = case params[:period]
    when "day"
      1.day.ago
    when "week"
      1.week.ago
    when "month"
      1.month.ago
    end
    @visits = @visits.where("created_at > ?", period)
  end
end

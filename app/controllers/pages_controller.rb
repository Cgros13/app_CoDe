class PagesController < ApplicationController
  def home
    @visits = current_user.visits.order(created_at: :asc)

    case params[:period]
    when "day"
      @visits = @visits.where("created_at > ?", 1.day.ago)
    when "week"
      @visits = @visits.where("created_at > ?", 1.week.ago)
    when "month"
      @visits = @visits.where("created_at > ?", 1.month.ago)
    end
  groups = @visits.group_by { |visit| visit.url.split(Regexp.union([".com", ".fr"])) }.map { |x| x }
    @group_urls = groups.first(10).map(&:first).flatten.filter { |x| x != "/" }

    @group_co2s = groups.first(10).map(&:last).map do |t|
      t.map(&:co2_by_time).sum.round(2) / 4
    end
  end
end

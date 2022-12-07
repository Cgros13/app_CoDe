class PagesController < ApplicationController
  def home
    @visits = current_user.visits

    case params[:period]
    when "day"
      @visits = @visits.where("created_at > ?", 1.day.ago)
    when "week"
      @visits = @visits.where("created_at > ?", 1.week.ago)
    when "month"
      @visits = @visits.where("created_at > ?", 1.month.ago)
    end
  end
end

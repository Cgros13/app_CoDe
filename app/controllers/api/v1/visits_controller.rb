class Api::V1::VisitsController < Api::V1::BaseController
  def create
    puts "je suis dans create de visit"
    ap visit_params
    ap current_user
    visit = Visit.new(visit_params)
    visit.user = current_user
    if visit.save
      render json: visit
    else
      render_error
    end
  end

  private

  def visit_params
    params.require(:visit).permit(:url)
  end
end

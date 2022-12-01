class Api::V1::VisitsController < Api::V1::BaseController
  def create
    visit = Visit.new(visit_params)
    visit.user = current_user
    if visit.save
      json = FetcherApiCarbonService.new(visit.url).call
      cleaner_than = json["cleanerThan"] * 100
      if cleaner_than > 50
        render json: {WebSiteCarbon: json, message: "This website is cleaner than #{cleaner_than.to_i}% of the websites on the internet!" }
      else
        render json: {WebSiteCarbon: json, message: "This website is dirtier than #{(100 - cleaner_than).to_i}% of the websites on the internet!" }
      end
    else
      render_error
    end
  end

  def show
    visit = Visit.find(params[:id])
    render json: visit
  end
# show visit.find_by_url to json
  private

  def visit_params
    params.require(:visit).permit(:url)
  end
end

class Api::V1::VisitsController < Api::V1::BaseController

  def create
    @visit = Visit.new(visit_params)
    ap current_user
    ap visit_params
    response = FetcherApiCarbonService.new(@visit.url).call
    @visit.cleaner_than = response["cleanerThan"] if response["cleanerThan"]
    @visit.user = current_user

    if @visit.save
      ap @visit
      render :show, status: :created
    else
      ap @visit.errors.full_messages.to_sentence
      render json: { error: "This website is not valid" }
    end
  end

  def show
    @visit = Visit.find(params[:id])
  end
# show visit.find_by_url to json
  private

  def visit_params
    params.require(:visit).permit(:url)
  end
end

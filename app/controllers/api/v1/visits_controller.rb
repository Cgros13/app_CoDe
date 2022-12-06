class Api::V1::VisitsController < Api::V1::BaseController
  def create
    @visit = Visit.new(visit_params)
    ap current_user
    ap visit_params
    response = FetcherApiCarbonService.new(@visit.url).call
    @visit.cleaner_than = response["cleanerThan"] if response["cleanerThan"]
    @visit.green = response["green"] if response["green"]
    @visit.bytes = response["bytes"] if response["bytes"]
    @visit.statistics = response["statistics"] if response["statistics"]
    @visit.user = current_user

    if @visit.save
      ap @visit
      render :show, status: :created
    else
      ap @visit.errors.full_messages.to_sentence
      render json: { error: "This website is not valid" }
    end
  end

  def update
    @visit = Visit.find(params[:id])
    # @visit.end_time = response["end_time"] if response["end_time"]
    @visit.update(visit_params)
    return unless params[:visit][:end_time]

    @visit.update(end_time: Time.at(params[:visit][:end_time] / 1000))
    ap @visit
  end

  def index
    @visits = current_user.visits.where(url: params[:url]).where.not(cleaner_than: nil)

    render json: @visits
  end

  def show
    @visit = Visit.find(params[:id])
  end
# show visit.find_by_url to json
  private

  def visit_params
    params.require(:visit).permit(:url, :end_time)
  end
end

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

  def index
    @visits = current_user.visits
    if params[:url].present?
      @visits = @visits.where(url: params[:url]).where.not(cleaner_than: nil)
      # test du if pour cleaner_than
      # if @visits[0].cleaner_than < 0.5
      #   percentage = ((1 - @visits[0].cleaner_than) * 100).round
      #   render json: { "This website is dirtier than "}
      else
        render :index
      end
    end

    render json: @visits
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

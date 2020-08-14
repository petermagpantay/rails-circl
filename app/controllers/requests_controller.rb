class RequestsController < ApplicationController
  def index
    @requests = policy_scope(Request).order(created_at: :desc)
    @guest_event_requests = current_user.requests.order(created_at: :desc)
    @host_events_requests = current_user.events.map(&:requests)
  end

  def show
    @request = Request.find(params[:id])
    authorize @request
  end

  def create
    @request = Request.new
    @event = Event.find(params[:event_id])
    @request.event = @event
    @request.user = current_user
    authorize @request
    
    if @request.save!
      redirect_to event_path(@event)
    else
      render :show
    end
  end

  def validate
    @request = Request.find(params[:id])
    @request.update(status: params[:commit])
    authorize @request
    redirect_to requests_path
  end

  private

  def request_params
    params.require(:request).permit(:status)
  end
end

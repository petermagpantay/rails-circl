class RequestsController < ApplicationController
  def index
    @requests = policy_scope(Request).order(created_at: :desc)

    # @request_as_INVITED
    @guest_requests = current_user.requests
    # @request_as_HOST
    @host_events_requests = current_user.events.map(&:requests)
  end

  def show
    skip_authorization
    @request = Request.find(params[:id])
  end

  def new
    skip_authorization
    @event = Event.find(params[:event_id])
    @request = Request.new
  end

  def create
    skip_authorization
    @request = Request.new()
    @event = Event.find(params[:event_id])
    @request.event = @event
    @request.user = current_user
    @request.save
    redirect_to event_path(@event)
  end

  def validate
    skip_authorization
    
  end

  private

  def request_params
    params.require(:request).permit(:status)
  end
end

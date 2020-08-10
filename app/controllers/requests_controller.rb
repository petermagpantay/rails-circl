class RequestsController < ApplicationController
  def index 
    @requests = Request.all
  end

  def show 
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

  private 

  def request_params
    params.require(:request).permit()
  end
end

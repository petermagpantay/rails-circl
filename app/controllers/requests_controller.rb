class RequestsController < ApplicationController
  def index 
    @requests = Request.all
  end

  def show 
    @request = Request.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @request = Request.new 
  end

  def create
    @request = Request.new(request_params)
    @event = Event.find(params[:event_id])
    @request.event = @event
    @request.save
    redirect_to event_path(@event)
  end
end

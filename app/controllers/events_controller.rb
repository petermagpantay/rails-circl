class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
        @events = policy_scope(Event.where("location ILIKE ?", "%#{params[:query]}%"))
    else
        @events = policy_scope(Event).order(created_at: :desc)
        @user = current_user
    end
    @events = @events.geocoded
    @markers = @events.map do |event|
        {
          lat: event.latitude,
          lng: event.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
          image_url: helpers.asset_url('marker.png')
        }
    end
  end

  def show
    @event = Event.find(params[:id])
    # @accepted created to filter request status == accepted
    @accepted = []
    @event.requests.each do |request|
      if request.status == "accepted"
        @accepted << request.user
      end
    end
    authorize @event

    # @eventShow = Event.find(params[:id])
    @event_show = Event.find(params[:id])
    @marker = 
        [{
          lat: @event_show.latitude,
          lng: @event_show.longitude,
          image_url: helpers.asset_url('marker.png')
        }]
  end

    def new
        @event = Event.new
        authorize @event
    end

    def create
        @event = Event.new(event_params)
        @event.user = current_user
        authorize @event
        if @event.save
            redirect_to events_path
        else
            render :new
        end
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :location, :event_date, :event_time)
    end
end

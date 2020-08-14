class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
        sql_query = "location ILIKE :query OR title ILIKE :query"
        @events = policy_scope(Event.where(sql_query, query: "%#{params[:query]}%"))
        # @events = policy_scope(Event.where("location ILIKE ?", "%#{params[:query]}%"))
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
    @accepted = @event.requests.where(status: "accepted")
    authorize @event

    # @eventShow = Event.find(params[:id])
    @event_show = Event.find(params[:id])
    @marker = 
      [{
        lat: @event_show.latitude,
        lng: @event_show.longitude,
        image_url: helpers.asset_url('marker.png')
      }]
    @comment = Comment.new
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

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    authorize @event
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    authorize @event
    redirect_to profile_path(current_user.id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :event_date)
  end
end

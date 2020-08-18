class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @category = Category.new
    if params[:query].present? && params[:category].present?
      @events = policy_scope(Event.near(params[:query],10)).joins(:event_categories).where(event_categories: { category_id: params[:category][:id]})

    elsif params[:query].present?
      @events = policy_scope(Event.near(params[:query],10))

    elsif params[:category].present?
      @events = policy_scope(Event).joins(:event_categories).where(event_categories: { category_id: params[:category][:id]})
    
    else
      @events = policy_scope(Event).order(created_at: :desc)
    end

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { event: event }),
        image_url: helpers.asset_url("marker.png"),
      }
    end
  end

  def show
    @event = Event.find(params[:id])
    #to show the pool of accepted participants
    @accepted = []
    @event.requests.each do |request|
      if request.status == "accepted"
        @accepted << request.user
      end
    end
    @accepted = @event.requests.where(status: "accepted")
    authorize @event
    if user_signed_in?
      @request_done = current_user.requests.find_by(event: @event)
    end
    # @eventShow = Event.find(params[:id])
    @event_show = Event.find(params[:id])
    @marker =
      [{
        lat: @event_show.latitude,
        lng: @event_show.longitude,
        image_url: helpers.asset_url("marker.png"),
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
      redirect_to @event
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
    params.require(:event).permit(:title, :description, :location, :event_date, :photo, category_ids: [])
  end
end

class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @events = policy_scope(Event).order(created_at: :desc)
    @user = current_user
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

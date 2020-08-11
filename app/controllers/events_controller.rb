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
end

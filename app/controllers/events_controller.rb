class EventsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        @events = policy_scope(Event).order(created_at: :desc)
        @user = current_user
    end

    def show
        @event = Event.find(params[:id])
        authorize @event
    end
end

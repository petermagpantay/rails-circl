class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @events = policy_scope(Event)
    @request_counts = []
    @events.each do |event|
      hash = { event: event, requests: event.requests.length }
      @request_counts.push(hash)
    end
    @sorted_request_counts = @request_counts.sort_by{ |h | -h[:requests] }

    @top_events = []
    @top_events.push(@sorted_request_counts[0].values.first)
    @top_events.push(@sorted_request_counts[1].values.first)
    @top_events.push(@sorted_request_counts[2].values.first)
  end
end

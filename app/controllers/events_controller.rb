# no doc
class EventsController < ApplicationController
  def index
    @events = current_user.events
  end

  def show
    @event = Event.find(params[:id])
  end
end

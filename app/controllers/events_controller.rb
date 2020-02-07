class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    return unless @event.save

    @event.content.capitalize!
    redirect_to current_user
  end

  def show
    @attendance = current_user.attendances.build
    @event = Event.find(params[:id])
    @invited = @event.attendees.where('pending')
    @accepted = @event.attendees.where('accepted')
    @rejected = @event.attendees.where('rejected')
    @users = User.where.not(id: current_user.id).to_a.reject do |user|
      @invited.include?(user) || @accepted.include?(user) || @rejected.include?(user)
    end
  end

  def index
    @upcoming = Event.upcoming
    @past = Event.past
  end

  private

  def event_params
    params.require(:event).permit(:content, :date)
  end
end

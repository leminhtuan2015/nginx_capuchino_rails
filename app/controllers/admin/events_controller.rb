class Admin::EventsController < Admin::BaseController
  include Admin::BaseHelper
  def index
    @events = Event.page(params[:page]).per this_blog.limit_event_display
  end
end

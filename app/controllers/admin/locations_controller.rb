class Admin::LocationsController < Admin::BaseController
  cache_sweeper :blog_sweeper

  def index
    @locations = Location.page(params[:page]).per this_blog.limit_location_display
  end
end

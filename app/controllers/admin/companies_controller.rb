class Admin::CompaniesController < Admin::BaseController
  include Admin::BaseHelper
  def index
    @companies = Company.page(params[:page]).per this_blog.limit_company_display
  end
end

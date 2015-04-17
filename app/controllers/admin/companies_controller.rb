class Admin::CompaniesController < Admin::BaseController
  include Admin::BaseHelper
  def index
    @companies = Company.page(params[:page]).per this_blog.limit_company_display
  end

  def new
    @company = Company.new
  end

  def create
    if Company.create company_params
      flash[:success] = t "admin.company.create_company_success"
      redirect_to admin_companies_path
    else
      flash[:danger] = t "admin.company.create_company_fail"
      render :new
    end
  end

  private
  def company_params
    params.require(:company).permit :name
  end
end

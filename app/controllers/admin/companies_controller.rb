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

  def edit
    @company = Company.find params[:id]
  end

  def update
    @company = Company.find params[:id]
    if @company.update_attributes company_params
      flash[:success] = t "admin.company.update_company_success"
      redirect_to admin_companies_path
    else
      flash[:danger] = t "admin.company.update_company_fail"
      render :edit
    end
  end

  def show
    @company = Company.find params[:id]
  end

  def destroy
    if Company.find(params[:id]).destroy
      flash[:success] = t "admin.company.destroy_company_success"
    else
      flash[:danger] = t "admin.company.destroy_company_fail"
    end
    redirect_to admin_companies_path
  end

  private
  def company_params
    params.require(:company).permit :name
  end
end

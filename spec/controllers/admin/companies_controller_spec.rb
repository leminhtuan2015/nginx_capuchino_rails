require "spec_helper"
describe Admin::CompaniesController do
  let(:company) {mock_model Company}
  let(:admin) {create :user, :as_admin}
  let!(:blog) {create :blog}

  before {request.session = {user: admin.id}}

  describe "GET index" do
    before {get :index}
    
    it {expect(response).to render_template :index}
    it {expect(response.status).to eq 200}
    it {expect(assigns :companies).to eq [company]}
  end

  describe "POST create" do
    let(:company_params) {{company: "company_name"}}
    context "when the company saves successfully" do
      it do
        expect{post :create, company: company_params}.to change(Company, :count).by 1
      end
    end

    context "when the company saves failure" do
      before do
        Company.stub(:new).and_return company
        Company.stub(:save).and_return false
      end
      it do
        expect{post :create, company: company_params}.not_to change(Company, :count)
      end
    end
  end

  describe "POST update" do
    let(:company) {FactoryGirl.create :company}
    context "when the company update successfully" do
      before {post :update, id: company.id, company: {name: "New_name"}}
      
      it {expect(response).to redirect_to admin_companies_path}
      it {expect(flash[:success]).to eq I18n.t("admin.company.update_company_success")}
      it {expect(company.reload.name).to eq "New_name"}
    end

    context "when the company update failure" do
      let(:invalid_company_params) {{name: nil}}
      before do
        Company.stub(:update_attributes).and_return false
        post :update, id: company.id, company: invalid_company_params
      end
      it {expect(response).should render_template :edit}
    end
  end

  describe "DELETE Destory" do
    before {company = FactoryGirl.create :company}
    it do
      expect{delete :destroy, id: company.id}.to change(Company, :count).by -1
    end
  end

  describe "GET show" do
    let(:company) {FactoryGirl.create :company}
    before {get :show, id: company.id}
    it {expect(response).to render_template :show}
    it {expect(assigns[:company]).to eq company}
  end
end

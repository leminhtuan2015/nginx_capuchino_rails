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
end

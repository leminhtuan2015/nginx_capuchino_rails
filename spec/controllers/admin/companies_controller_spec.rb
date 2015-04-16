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
end

require "spec_helper"
describe Admin::EventsController do
  let(:admin) {create :user, :as_admin}
  let!(:blog) {create :blog}

  before {request.session = {user: admin.id}}

  describe "GET index" do
    let!(:events) {FactoryGirl.create_list :event, 5}
    before {get :index}
    
    it {expect(response).to render_template :index}
    it {expect(response.status).to eq 200}
    it {expect(assigns :events).to eq events}
  end
end

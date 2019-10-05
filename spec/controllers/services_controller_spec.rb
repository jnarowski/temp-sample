require 'rails_helper'

RSpec.describe Api::V1::ServicesController, type: :controller do
  before :each do
    request.headers['accept'] = 'application/json'
  end

  let(:user) do
    create(:user)
  end

  describe 'GET #index' do
    before :each do
      request.headers.merge(auth_headers(user))
    end

    it 'should return a list of services' do
      user = create(:user, email: 'user@user.com', password: 'tester', password_confirmation: 'tester')

      service = create(:service)
      service_item = create(:service_item, name: 'Better', service: service)

      get :index

      expect(json[:results].size).to eq(1)
      expect(json[:results].first[:id]).to eq(service.id)
      expect(json[:results].first[:service_items].size).to eq(1)
      expect(json[:results].first[:service_items].first[:id]).to eq(service_item.id)
    end
  end
end
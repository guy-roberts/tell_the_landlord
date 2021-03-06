require 'rails_helper'

RSpec.describe 'Organisations API', type: :request do

  tenant_name = Faker::Lorem.word.downcase

  before :all do
    Apartment::Tenant.create tenant_name

    Apartment::Tenant.switch! tenant_name

    #host! "http://end.#{tenant_name}.#{ENV["DOMAIN"]}"

  end

  after :all do
    Apartment::Tenant.drop tenant_name
  end

  let(:user) { create(:user, subdomain: tenant_name) }

  let!(:organisations) {
    create_list(:organisation, 1)
  }
  let(:organisation_id) { organisations.first.id }

  # authorize request
  let(:headers) { valid_headers.merge('HTTP_SERVER_NAME' => "#{tenant_name}.lvh.me:3000)")}

  # Test suite for GET /organisations
  describe 'GET /organisations' do
    # make HTTP get request before each example
    before { get('/organisations', params: {}, headers: headers) }

    it 'returns organisations' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json["data"].length).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /organisations/:id
  describe 'GET /organisations/:id' do
    before { get "/organisations/#{organisation_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the organisation' do
        expect(json).not_to be_empty
        expect(json['data']['id']).to eq(organisation_id.to_s)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:organisations_id) { 100 }
      it 'returns status code 404' do
        get "/organisations/100", params: {}, headers: headers

        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        get "/organisations/100", params: {}, headers: headers

        json = JSON.parse response.body

        expect(json['errors'][0]['title']).to match(/Record not found/)
      end
    end
  end

  # Test suite for POST /organisations
  describe 'POST /organisations' do
    # valid payload
    let(:valid_attributes) do
      # send json payload
      { name: 'Some attribute' }.to_json
    end

    let(:invalid_attributes) do
      # send json payload
      { name: 'ff' }.to_json
    end

    context 'when the request is valid' do
      before {
        post '/organisations', params: valid_attributes, headers: headers
      }

      xit 'creates a organisation' do
        expect(json['data']['name']).to eq('Some attribute')
      end

      xit 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/organisations', params: invalid_attributes, headers: headers }

      xit 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      xit 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Name by can't be blank/)
      end
    end
  end

  # Test suite for PUT /organisations/:id
  describe 'PUT /organisations/:id' do
    let(:valid_attributes) { { name: 'Acme Tiles' } }

    context 'when the record exists' do
      before { put "/organisations/#{organisation_id}", params: valid_attributes, headers: headers }

      xit 'updates the record' do
        expect(response.body).to be_empty
      end

      xit 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /organisations/:id
  describe 'DELETE /organisations/:id' do
    before { delete "/organisations/#{organisation_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

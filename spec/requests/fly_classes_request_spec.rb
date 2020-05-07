require 'rails_helper'

RSpec.describe 'FlyClasses', type: :request do
  let!(:user) { create(:user) }
  let!(:instructor) { create(:instructor) }
  let!(:fly_class) { create(:fly_class) }

  describe 'GET /fly_classes' do
    before { get '/fly_classes' }

    it 'returns' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /fly_classes' do
    let(:valid_attributes) do
      {
        user_id: 1,
        instructor_id: 1,
        classTime: '2020-05-06',
        status: false
      }
    end

    let(:no_user) do
      {
        instructor_id: 1,
        classTime: '2020-05-06',
        status: false
      }
    end

    let(:no_inst) do
      {
        user_id: 1,
        classTime: '2020-05-06',
        status: false
      }
    end

    let(:no_time) do
      {
        user_id: 1,
        instructor_id: 1,
        status: false
      }
    end

    context 'when the request is valid' do
      before { post '/fly_classes', params: valid_attributes }

      it 'creates a fly class' do
        expect(json['id']).to eq(2)
        expect(json['user_id']).to eq(1)
        expect(json['instructor_id']).to eq(1)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when there is no user' do
      before { post '/fly_classes', params: no_user }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: User must exist/)
      end
    end

    context 'when there is no instructor' do
      before { post '/fly_classes', params: no_inst }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Instructor must exist/)
      end
    end

    context 'when there is no classTime' do
      before { post '/fly_classes', params: no_time }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Classtime can't be blank/)
      end
    end
  end

  describe 'DELETE /fly_classes' do
    before { delete '/fly_classes/1' }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

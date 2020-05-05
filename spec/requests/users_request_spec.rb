require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { create(:user) }

  describe 'GET /users' do
    before { get '/users' }

    it 'returns' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    context 'when the record exists' do
      before { get '/users/1' }

      it 'returns the instructor data' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(1)
        expect(json['name']).to eq(user.name)
        expect(json['email']).to eq(user.email)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exists' do
      before { get '/users/2' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  describe 'GET /login' do
    context 'Successfull login' do
      before { get '/login', params: { email: user.email, password: user.password } }

      it 'returns' do
        expect(json['name']).to eq(user.name)
        expect(json['email']).to eq(user.email)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'not a user email login' do
      before { get '/login', params: { email: 'nope', password: user.password } }

      it 'returns false' do
        expect(json).to be_falsy
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'wrong password' do
      before { get '/login', params: { email: 'user.email', password: 'foobaz' } }

      it 'returns false' do
        expect(json).to be_falsy
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /users' do
    let(:valid_attributes) do
      {
        name: 'Jonny Doe',
        email: 'jonnyd@email.com',
        password: 'foobar',
        password_confirmation: 'foobar'
      }
    end

    let(:no_name) do
      {
        email: 'jd@email.com',
        password: 'foobar',
        password_confirmation: 'foobar'
      }
    end

    let(:no_email) do
      {
        name: 'J Doe',
        password: 'foobar',
        password_confirmation: 'foobar'
      }
    end

    let(:dif_pass) do
      {
        name: 'J Doe',
        email: 'jd@email.com',
        password: 'foobar',
        password_confirmation: 'foobas'
      }
    end

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'creates a user' do
        expect(json.size).to eq(1)
        expect(json['status']).to be_truthy
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when there is no name' do
      before { post '/users', params: no_name }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end

    context 'when there is no email' do
      before { post '/users', params: no_email }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Email can't be blank/)
      end
    end

    context 'when the confirmation is diffent from the password' do
      before { post '/users', params: dif_pass }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Password confirmation doesn't match Password/)
      end
    end
  end

  describe 'PATCH /users' do
    before { patch '/users/1', params: { name: 'John Doe' } }

    it 'returns' do
      expect(json['status']).to be_truthy
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'DELETE /users' do
    before { delete '/users/1' }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

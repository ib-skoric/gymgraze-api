require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe OpenaiController, type: :controller do
  it 'should return 401 if no token is provided' do
    post :create
    expect(response).to have_http_status(401)
  end

  it 'response should include key value called api_key' do
    @user = FactoryBot.build(:jane_doe)
    request.headers.merge!(authentication_helper(@user))
    post :create
    expect(response.body).to include('api_key')
  end
end
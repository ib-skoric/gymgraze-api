require 'rails_helper'
require 'spec_helper'

describe UsersController do
describe "GET to /users/:id endpoint" do
    let (:user) { FactoryBot.create(:user) }

    it "returns the user" do
      request.headers.merge!({'Authorization': "Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.DiPWrOKsx3sPeVClrm_j07XNdSYHgBa3Qctosdxax3w" })
      get "show", params: { id: user.id }

      expect(response).to have_http_status(:ok)
    end
  end
end
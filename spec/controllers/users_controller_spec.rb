require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe UserController do
  describe "GET to /users/:id endpoint" do
    let (:user) { FactoryBot.create(:user, email: "testing", password: "testing2313543435", id: 4) }

    it "returns the user whose token we passed in" do
      request.headers.merge!(authentication_helper(user))
      get "index", params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST to /users endpoint" do
    it "creates a new user" do
      post 'create', params: { user: { email: "testing", password: "testing2313543435", name: "Tester", age: 35, weight: 80, height: 170 } }

      expect(response).to have_http_status(:created)
    end
  end

  describe "POST to /request_reset_password endpoint" do
    let (:user) { FactoryBot.create(:user) }

    it "should throw unauthorised if the bearer token is not present" do\
      post 'request_password_reset', params: {}
      expect(response).to have_http_status(:unauthorized)
    end

    it "should send a reset password email" do
      request.headers.merge!(authentication_helper(user))
      post 'request_password_reset', params: {}
      expect(response).to have_http_status(:accepted)
    end

    it "should throw unauthorised if the user is not found using the token" do
      request.headers.merge!(authentication_helper(user))
      post 'reset_password', params: { token: "some_invalid_token" }
      expect(response).to have_http_status(:unauthorized)
    end

    it "should reset the password when the token is valid" do
      request.headers.merge!(authentication_helper(user))
      post 'request_password_reset', params: {}
      token = user.signed_id(purpose: "password_reset")
      post 'reset_password', params: { token: token, user: { password: "newpassword" } }
      expect(response).to have_http_status(:accepted)
    end
  end

  describe "POST to /check_email_exists endpoint" do
    let (:user) { FactoryBot.create(:user) }

    it "should return a conflict if the email is already in use" do
      post 'check_email_exists', params: { email: user.email }
      expect(response).to have_http_status(:conflict)
    end

    it "should return ok if the email is not in use" do
      post 'check_email_exists', params: { email: "some_other_email@test.com" }

      expect(response).to have_http_status(:ok)
  end
  end
  end
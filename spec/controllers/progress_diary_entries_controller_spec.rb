require 'rails_helper'
require 'spec_helper'
require 'authentication_helper'

describe ProgressDiaryEntriesController, type: :controller do
  before(:all) do
    @user = FactoryBot.build(:jane_doe)

  end

  describe "POST /progress_diary_entries" do
    it "creates a new progress diary entry" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { progress_diary_entry: { date: "2021-01-01", weight: 150, arm_measurement: 12, waist_measurement: 30, body_fat_percentage: 10, chest_measurement: 36 } }

      expect(response).to have_http_status(:created)
    end

    it "returns an error if the progress diary entry is invalid" do
      request.headers.merge!(authentication_helper(@user))
      post "create", params: { progress_diary_entry: { date: nil } }

      expect(response).to have_http_status(422)
      expect(response.body).to include("can't be blank")
    end
  end

  describe "GET /progress_diary_entries/fetch_by_date" do
    it "fetches a progress diary entry by date" do
      diary_entry = FactoryBot.create(:progress_diary_entry, user: @user)
      request.headers.merge!(authentication_helper(@user))
      get "fetch_by_date", params: { date: diary_entry.date }

      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /progress_diary_entries/:id" do
    it "deletes a progress diary entry" do
      diary_entry = FactoryBot.create(:progress_diary_entry, user: @user)
      request.headers.merge!(authentication_helper(@user))
      delete "destroy", params: { id: diary_entry.id }

      expect(response).to have_http_status(:no_content)
    end
  end
end
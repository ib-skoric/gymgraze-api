class TrendsController < ApplicationController
  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user

  def index
    weights = get_weight_for_last_7days
    body_fat_percentages = get_body_fat_percentages_for_last_7days
    arm_measurements = get_arm_measurements_for_last_7days
    waist_measurements = get_waist_measurements_for_last_7days
    chest_measurements = get_chest_measurements_for_last_7days
    render json: { weights: weights, body_fat_percentages: body_fat_percentages, arm_measurements: arm_measurements, waist_measurements: waist_measurements, chest_measurements: chest_measurements  }, status: :ok
  end

  private

  def get_weight_for_last_7days
    # first get progress diary entries
    progress_diaries = get_progress_diaries
    # then get the weight for each entry
    # and return it as object with date and weight

    weights = []

    progress_diaries.each do |progress_diary|
      weights << { id: rand(99999999), date: progress_diary.date, weight: progress_diary.weight.to_f }
    end

    weights
  end

  def get_body_fat_percentages_for_last_7days
    progress_diaries = get_progress_diaries
    body_fat_percentages = []

    progress_diaries.each do |progress_diary|
      body_fat_percentages << { id: rand(99999999), date: progress_diary.date, body_fat_percentage: progress_diary.body_fat_percentage.to_f }
    end

    body_fat_percentages
  end

  def get_arm_measurements_for_last_7days
    progress_diaries = get_progress_diaries
    arm_measurements = []

    progress_diaries.each do |progress_diary|
      arm_measurements << { id: rand(99999999), date: progress_diary.date, arm_measurement: progress_diary.arm_measurement.to_f }
    end

    arm_measurements
  end

  def get_waist_measurements_for_last_7days
    progress_diaries = get_progress_diaries
    waist_measurements = []

    progress_diaries.each do |progress_diary|
      waist_measurements << { id: rand(99999999), date: progress_diary.date, waist_measurement: progress_diary.waist_measurement.to_f }
    end

    waist_measurements
  end

  def get_chest_measurements_for_last_7days
    progress_diaries = get_progress_diaries
    chest_measurements = []

    progress_diaries.each do |progress_diary|
      chest_measurements << { id: rand(99999999), date: progress_diary.date, chest_measurement: progress_diary.chest_measurement.to_f }
    end

    chest_measurements
  end

  def get_progress_diaries
    ProgressDiaryEntry.where(user_id: @user.id, date: 7.days.ago..Date.today)
  end
end
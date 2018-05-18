class Workout < ApplicationRecord
  belongs_to :user
  validates_presence_of :distance, :speed, :pace

  scope :today, -> { where(created_at: DateTime.now.beginning_of_day..DateTime.now.end_of_day) }
end

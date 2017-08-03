class Workout < ApplicationRecord
  belongs_to :user
  validates_presence_of :start_time, :end_time, :distance, :speed, :pace
end

class Workout < ApplicationRecord
  belongs_to :user
  validates_presence_of :distance, :speed, :pace
end

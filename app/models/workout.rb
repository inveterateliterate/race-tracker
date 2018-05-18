class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :race, optional: true
  validates_presence_of :distance, :speed, :pace
end

class Race < ApplicationRecord
  belongs_to :user
  has_many :tweets
  has_many :hashtags

  validates_presence_of :date, :name, :distance
end

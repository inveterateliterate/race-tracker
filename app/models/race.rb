class Race < ApplicationRecord
  validates_presence_of :date, :name, :distance

  belongs_to :user
  has_many :tweets
end

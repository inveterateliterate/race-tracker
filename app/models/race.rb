class Race < ApplicationRecord
  validates_presence_of :date, :name, :title

  belongs_to :user
  has_many :tweets
end

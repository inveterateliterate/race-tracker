class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :race, optional: true

  validates_presence_of :date, :content
end

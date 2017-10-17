class Hashtag < ApplicationRecord
  belongs_to :race, optional: true
  validates_presence_of :text
end

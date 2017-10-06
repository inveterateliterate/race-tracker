class HashTag < ApplicationRecord
  belongs_to :race, optional: true
  validates_presence_of :tag
end

class HashTag < ApplicationRecord
  belongs_to :race
  validates_presence_of :tag
end

class Race < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy
  has_many :hash_tags, dependent: :destroy

  validates_presence_of :date, :name, :distance

  accepts_nested_attributes_for :hash_tags

  module Distances
    MARATHON = '26.2 miles'
    HALF_MARATHON = '13.1 miles'
    TEN_K = '10 K'
    FIVE_K = '5 K'
  end

  def marathon?
    distance == Distances::MARATHON
  end

  def half_marathon?
    distance == Distances::HALF_MARATHON
  end
end

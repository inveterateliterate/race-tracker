class Race < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy
  has_many :hash_tags, dependent: :destroy

  validates_presence_of :date, :name, :distance

  accepts_nested_attributes_for :hash_tags, reject_if: lambda { |tag| tag[:tag].blank? }, allow_destroy: true

  module RaceTypes
    MARATHON = {
      name: 'marathon',
      distance: '26.2 miles'
    }
    HALF_MARATHON = {
      name: 'half-marathon',
      distance: '13.1 miles'
    }
    TEN_K = {
      name: '10 K',
      distance: '10 K'
    }
    FIVE_K = {
      name: '5 K',
      distance: '5 K'
    }
    ALL = [MARATHON, HALF_MARATHON, TEN_K, FIVE_K]
  end

  def marathon?
    distance == Distances::MARATHON[:name]
  end

  def half_marathon?
    distance == Distances::HALF_MARATHON[:name]
  end
end

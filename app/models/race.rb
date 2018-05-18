class Race < ApplicationRecord
  belongs_to :user
  has_many :tweets
  has_many :hash_tags

  validates_presence_of :date, :name, :distance

  def marathon?
    distance == '26.2 miles'
  end

  def half_marathon?
    distance == '13.1 miles'
  end
end

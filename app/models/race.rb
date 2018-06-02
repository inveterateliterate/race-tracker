class Race < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy
  has_many :hash_tags, dependent: :destroy

  validates_presence_of :date, :name, :distance

  accepts_nested_attributes_for :hash_tags

  def marathon?
    distance == '26.2 miles'
  end

  def half_marathon?
    distance == '13.1 miles'
  end
end

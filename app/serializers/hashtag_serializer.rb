class HashtagSerializer < ActiveModel::Serializer
  attributes :id,
             :text

  belongs_to :race
end

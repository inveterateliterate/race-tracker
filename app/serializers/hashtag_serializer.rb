class HashtagSerializer < ActiveModel::Serializer
  attributes :id,
             :tag

  belongs_to :race
end

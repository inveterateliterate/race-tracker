class RaceDecanter < Decanter::Base
  input :date, :date
  input :name, :string
  input :distance, :string
  input :user_id, :integer

  has_many :hash_tags
end

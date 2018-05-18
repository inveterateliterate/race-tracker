class TweetDecanter < Decanter::Base
  input :date, :date
  input :content, :string
  input :user_id, :integer
  input :race_id, :integer
end

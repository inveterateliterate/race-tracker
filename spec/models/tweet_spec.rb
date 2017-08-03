require 'rails_helper'

RSpec.describe Tweet, type: :model do
  subject { build(:tweet) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:content) }

  it { is_expected.to belong_to(:user) }
end

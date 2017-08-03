require 'rails_helper'

RSpec.describe Race, type: :model do
  subject { build(:race) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:distance) }
  it { is_expected.to belong_to(:user) }
end

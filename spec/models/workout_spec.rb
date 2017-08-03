require 'rails_helper'

RSpec.describe Workout, type: :model do
  subject { build(:workout) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
  it { is_expected.to validate_presence_of(:distance) }
  it { is_expected.to validate_presence_of(:speed) }
  it { is_expected.to validate_presence_of(:pace) }

  it { is_expected.to belong_to(:user) }
end

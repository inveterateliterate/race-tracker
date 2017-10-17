require 'rails_helper'

RSpec.describe Hashtag, type: :model do
  subject { build(:hashtag) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:tag) }
end

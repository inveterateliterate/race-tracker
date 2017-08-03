require 'rails_helper'

RSpec.describe HashTag, type: :model do
  subject { build(:hash_tag) }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:tag) }
end

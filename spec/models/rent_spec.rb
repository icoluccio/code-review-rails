require 'rails_helper'

RSpec.describe Rent do
  subject(:rent) { build(:rent) }
  it { is_expected.to validate_presence_of(:user) }
  it { is_expected.to validate_presence_of(:book) }
  it { is_expected.to validate_presence_of(:rent_in) }
  it { is_expected.to validate_presence_of(:rent_out) }
  it { is_expected.to be_valid }
end

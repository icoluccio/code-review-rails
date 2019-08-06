require 'rails_helper'

RSpec.describe User do
  subject(:user) { build(:user) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to be_valid }
end

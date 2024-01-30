require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has factory' do
    expect(create(:user)).to be_persisted
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:living_place) }
    it { should validate_presence_of(:observations) }
    it { should validate_presence_of(:birthdate) }
  end

  describe 'associations' do
    it { should belong_to(:sex) }
  end
end

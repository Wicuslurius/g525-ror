require 'rails_helper'

RSpec.describe Sex, type: :model do
  it 'has factory' do
    expect(create(:sex)).to be_persisted
  end
end

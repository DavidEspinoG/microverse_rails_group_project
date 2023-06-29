require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name should be present' do
    user1 = User.new(name: 'John', email: 'john@test.com', password: '12345678')
    check = user1.valid?

    expect(check).to eq(true)
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:fly_classes).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end

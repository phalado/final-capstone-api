require 'rails_helper'

RSpec.describe Instructor, type: :model do
  it { should have_many(:fly_classes).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:instImage) }
  it { should validate_presence_of(:dragonType) }
  it { should validate_presence_of(:dragonName) }
  it { should validate_presence_of(:dragonImage) }
end

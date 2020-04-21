class Instructor < ApplicationRecord
  has_many :fly_classes, dependent: :destroy

  validates_presence_of :name, :dragonType, :dragonName
end

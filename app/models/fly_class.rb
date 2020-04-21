class FlyClass < ApplicationRecord
  belongs_to :instructor

  validates_presence_of :name, :classTime
end

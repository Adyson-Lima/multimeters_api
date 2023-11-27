class Multimeter < ApplicationRecord
  validates :mult_type, :description, presence: true
end

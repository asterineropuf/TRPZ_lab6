class DisabilityType < ApplicationRecord
  has_many :disability_types_places
  has_many :places, through: :disability_types_places
  validates :name, presence: true
end
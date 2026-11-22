class Place < ApplicationRecord
  belongs_to :district
  has_one :accessibility_passport, dependent: :destroy
  has_and_belongs_to_many :disability_types

  accepts_nested_attributes_for :accessibility_passport,
                                allow_destroy: true,
                                reject_if: ->(attrs) {
                                  attrs["ramp_angle"].blank? &&
                                    attrs["door_width_cm"].blank? &&
                                    attrs["hazard_gutters_note"].blank? &&
                                    attrs["has_elevator"] == "0"
                                }

  validates :name, presence: true, length: { minimum: 3, maximum: 120 }
  validates :category, presence: true
  validates :address, presence: true
  validates :latitude, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }, allow_nil: true
  validates :longitude, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }, allow_nil: true
end
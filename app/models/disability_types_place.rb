class DisabilityTypesPlace < ApplicationRecord
  belongs_to :disability_type
  belongs_to :place
end
class Place < ApplicationRecord
  geocoded_by :full_address
  # geocoded_by :address
  # after_validation :geocode

  # geocoder info
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?
  # after_validation :geocode, :if => :address_changed?
  # API Google
  # after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }
end

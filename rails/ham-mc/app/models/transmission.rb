class Transmission < ApplicationRecord

  validates :altitude, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :temperature, presence: true

  validates_numericality_of :altitude, greater_than: 0
  validates_numericality_of :latitude, greater_than: -90, less_than: 90
  validates_numericality_of :longitude, greater_than: -180, less_than: 180

  def self.create_random
    last_transmission = Transmission.order('created_at').last

    if last_transmission.blank?
      return Transmission.create(
          altitude: rand(1..100_000),
          latitude: rand(-90..90),
          longitude: rand(-180..180),
          temperature: rand(-80..40)
      )
    end

    new_altitude = last_transmission.altitude + rand(-100..100)
    new_altitude = 1 if new_altitude <= 0

    new_latitude = (last_transmission.latitude + rand(-1..1)) % 90
    new_longitude = (last_transmission.longitude + rand(-1..1)) % 180

    new_temperature = last_transmission.temperature + rand(-3..3)

    Transmission.create(
        altitude: new_altitude,
        latitude: new_latitude,
        longitude: new_longitude,
        temperature: new_temperature
    )

  end

end

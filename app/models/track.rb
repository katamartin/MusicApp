class Track < ActiveRecord::Base
  TRACK_TYPES = ["bonus", "regular"]

  validates :track_type, inclusion: TRACK_TYPES

  belongs_to(
    :album,
    class_name: :Album,
    foreign_key: :album_id,
    primary_key: :id
  )

  has_one(
    :band,
    through: :album,
    source: :band
  )
end

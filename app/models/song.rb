class Song < ApplicationRecord

  # validates if song doesn't already exist within same year
  validates :title, presence: true, uniqueness: {scope: :release_year}

  # Song is either released or not
  validates :released, inclusion: {in: [true, false]}

  # Can be absent if song has not released yet
  # Must be present if song has been released
  # Must be less than or equal to current year
  validates :release_year, presence: true, if: :released, numericality: {less_than_or_equal_to: 2020}

  validates :artist_name, presence: true
end

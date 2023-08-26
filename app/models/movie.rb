class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, :overview, presence: true, uniqueness: true

  has_one_attached :photo
end

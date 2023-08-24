class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :list, :movie, presence: true
  validates :comment, presence: true, length: { minimum: 6 }
  validates :movie, uniqueness: { scope: :list }
end

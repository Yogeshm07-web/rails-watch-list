class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_exception

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  before_destroy :ensure_no_bookmarks

  private

  def ensure_no_bookmarks
    throw(:abort) if bookmarks.any?
  end
end

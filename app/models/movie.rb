class Movie < ApplicationRecord
  validates :title, presence: true
  validates :overview, presence: true

  has_many :bookmarks, dependent: :restrict_with_exception
  # ... other associations and validations ...

  # ... other model logic ...
end

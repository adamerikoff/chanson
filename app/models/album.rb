class Album < ApplicationRecord
  belongs_to :artist
  has_one_attached :cover, dependent: :delete_all

  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }
  validates :release_date, presence: true, length: { maximum: 4 }

end

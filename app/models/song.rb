class Song < ApplicationRecord
  
  validates :title, presence: true, length: { minimum: 3 }

  belongs_to :artist
  belongs_to :genre
  belongs_to :album

  has_one_attached :audio, dependent: :delete_all

end

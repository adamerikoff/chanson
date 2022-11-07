class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs, dependent: :delete_all

  has_many :songs, through: :playlist_songs
end

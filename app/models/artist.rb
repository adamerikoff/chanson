class Artist < ApplicationRecord
  has_one_attached :avatar, dependent: :delete_all
  has_many :albums, dependent: :delete_all
  
  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }
  validates :about, presence: true, length: { minimum: 15 }

end

class Genre < ApplicationRecord

  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }

  has_many :songs, dependent: :delete_all

end

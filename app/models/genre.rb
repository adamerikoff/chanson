class Genre < ApplicationRecord

  validates :name, uniqueness: true, presence: true, length: { minimum: 3 }

end

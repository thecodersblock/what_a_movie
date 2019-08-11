class Movie < ApplicationRecord
  validates :name, :year, presence: true

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :users

end

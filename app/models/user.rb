class User < ApplicationRecord
  validates :username, uniqueness: true
  has_and_belongs_to_many :movies
end

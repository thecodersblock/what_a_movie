class User < ApplicationRecord
  validates :username, uniqueness: true, length: { maximum: 20 }, format: { with: /^[a-zA-Z0-9_]*$/, multiline: true, message: "Only alphanumeric and underscore allowed" }
  has_and_belongs_to_many :movies
end

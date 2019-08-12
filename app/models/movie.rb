require "mini_magick"

class Movie < ApplicationRecord
  validates :name, :year, presence: true

  has_and_belongs_to_many :genres
  has_and_belongs_to_many :users
  has_one_attached :thumbnail

  validate :check_image_resolution

  def check_image_resolution
    if thumbnail.attachment
      image = MiniMagick::Image.read(thumbnail.download)
      errors.add(:thumbnail, "Thumbnail height has to be 1000px") unless (image.height == 1000)
      errors.add(:thumbnail, "Thumbnail height has to be between 600px to 800px") unless (image.width.between?(600, 800))
      errors.add(:thumbnail, "Thumbnail has to be less than 1MB") unless (thumbnail.byte_size <= 1000000)
      errors.add(:thumbnail, "Thumbnail has to be of type JPG or PNG") unless (['PNG', 'JPG', 'JPEG'].include? image.type)
    end
  end
end

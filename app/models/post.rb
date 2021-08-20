class Post < ApplicationRecord
  has_many_attached :images
  # serialize :images, Array
end

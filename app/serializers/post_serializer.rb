class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :body, :date, :tags, :categories, :images

  # Do I need object.images[0]?
  def images
    if object.images.attached?
      {
        url: rails_blob_url(object.images, only_path: true)
      }
    end
  end
end

class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :body, :date, :tags, :categories, :images

  def images
    if object.images.attached?
      {
        url: "http://localhost:3001#{rails_blob_path(object.images[0], only_path: true)}"
      }
    end
  end
end

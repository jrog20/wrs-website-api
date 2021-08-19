class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :title, :body, :date, :images, :tags, :categories
  def images
    if object.images.attached?
      {
        url: rails_blob_url(object.images)
      }
    end
  end
end
